# Recommendation system

## Data

### User Behavior Data

1. Ratings
2. Clicks
3. Purchases
4. Pageviews

### User Demorgraphic Data

1. Age, Education, Income, Location

### Product Attribute Data

1. Genre(for Books)
2. Cast(for Movies)
3. Cuisine(for Food)

## Recommendation algorithms - from Data to Relationships

### Options

1. Find products with similar attributes(similar rating for product attributes) - content based filtering
   1. decide the attributes
      1. Movie
         1. Direction
         2. Cast
         3. Cinematography
         4. Story
      2. Book
         1. Author
         2. Story
         3. Genre
   2. rate the products against chosen attributes -> N dimension - need domain expert/human intervention to rate and create the n dimension database
   3. Similarity is measured using distance metrics
      1. Euclidean distance
      2. Hamming distance
      3. Correlation distance
   4. rate the user on the importance he/she gives to these factors(ex: aeverage of ratings of products that the user already likes)
   5. find the nearest neighbors of the user - to be the products to recommend to the user
2. Find products liked by similar users - collaborative filtering
   1. uses only user behavior data
   2. extract rating(explicit{ask consumer to rate or thumb up/down} or implicit{things customers click/purchase/consume/pageview}) for per user per product
   3. get rating matrix with user as y axis and products as x axis
   4. fill in the blank cells(product with no user rating) with ML techniques (nearest neighbor model - use the ratings of "most similar" users/latent factor analysis - solve for underlying factors that drive the ratings)
3. Find complementary products(above 2 are substitutable for each other, while here is complementary) - association rules learning
   1. Conditional Probabilities
   2. Help create offers for buyers of a certain product

### types

1. top N recommender
   1. option 1
      1. candidate generation
         1. from individual interests(distributed nosql datastore{explicit and implicit history data} like cassendra/mongo/memcached, lots of data with simple query, normalized using techniques such as mean centering/z-scores)
         2. from/to item similarities()
      2. candidate ranking - passed in from candidate generation
      3. filtering - passed in from candidate ranking
   2. option 2
      1. candidate generation
         1. from/to rating predictions table(every user for every item)
      2. candidate ranking
      3. filtering
   3. steps
      1. Setup the data
         1. Ratings - User,ISBN,Rating
         2. Book Metadata - ISBN,Title,Author
         3. Function to lookup metadata for an ISBN
         4. function to find the favorite books for a user
      2. Construct a rating matrix
         1. nearest neighbors: Ratings to Rating Matrix with users and products - pandas.pivot_table
         2. latent factors:  - scipy.coo_matrix
      3. method varied steps
         1. Find the K Nearest Neighbors - KNN
            1. calculate user distance - scipy(active user, k)
            2. function(active user, k) with distance function -> K nearest neighbors
         2. Initialize factor matrices - LF
      4. Find the top N recommendations
         1. KNN
            1. average the ratings of nearest neighbors for unrated books
            2. sort in descending order
            3. pick the top N
         2. LF ...

## Setup

1. anaconda [ref](http://deeplearning.lipingyang.org/2018/12/25/conda-commands-create-virtual-environments-for-python-with-conda/)
   1. create virtual env: `conda create -n [env name] python=[version] [packages separate by space, eg: anaconda]` I've created RecSys
   2. activate env: `source/conda (~/anaconda3/bin/)activate [env name]`
   3. list envs: `conda info -e` or `conda info --envs` or `conda env list`
   4. install packages to a venv: `conda install -n [env name] [package name]` or simply activate the venv and then `conda install [package name]`
   5. deactivate venv: `source/conda deactivate`
   6. delete venv: `conda remove -n [env name] -all` or `conda env remove -n [env name]`
   7. clone conda venv: `conda create --name [clone target env name] --clone [cloned env name]`
   8. view package list in a venv of conda: `conda list -n [env name]` or `conda list` when target venv is activated
   9. list a package in venv of conda: `conda list -n [env name] [package name]` or `conda list [package name]` when target venv is activated
   10. switch back to bash then to zsh: `chsh -s /bin/bash` -> restart iterm2 -> `zsh`, if wanna return to zsh: `chsh -s /bin/zsh`
   11. `echo 'source ~/.bash_profile' >> ~/.zshrc` to append bash variables to zsh
   12. update conda: `conda update conda`
   13. add `export PATH="/Users/username/anaconda3/bin:$PATH"` to ~/.bash_profile or ~/.zshrc to enable vscode recognition of venv created by conda.
2. scikit-surprise
   1. conda install -c conda-forge scikit-surprise
3. materials
   1. [download](https://sundog-education.com/RecSys/)

## Test if OK

run GettingStarted.py like `python -u "/Users/leolin/Projects/python/Leo.Data.Science/notebooks/Categories/Recommendation-System/RecSys-Materials/1. GettingStarted/GettingStarted.py"`

## issues

1. for unresolved import for local .py within vscode
   1. ctrl + shift + p -> configure language specific settings -> python
   2. in the open settings.json, uncomment `"python.jediEnabled": false`
   3. restart vscode and install microsoft python language server & pylint respectively, pylint should be installed to your current venv
2. [for latex](https://math.meta.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference)
$a+b=c$
$$
f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi \xi x} \,d\xi
$$

## Algorithms

### Nearest Neighbors Model

1. [book ratings dataset](http://www.bookcrossing.com)
2. choose collaborative filtering
3. fillin blanks with values calculated with weight of each user by existing product similarity. if k-means, then K nearest neighbors of a user and take average of the ratings of those neighbors for unrated books
   1. measure distance of users - SciPy
      1. Euclidean Distance(physical distance), x is dimension 1, y is dimension 2: $\sqrt{(x_2-x_1)^2+(y_2-y_1)^2+...[nth]}$
      2. Correlation Distance: how in sync the variations or deviations from the mean are for each of the value, x is value of each dimension for the first user, y is value of each dimension for the second user, mean is $\bar{x}$ or $\bar{y}$, then $Corr(x,y) = \frac{\sum_i(x_i-\bar{x})(y_i-\bar{y})}{\sqrt{\sum(x_i-\bar{x})^2}\sqrt{\sum(y_i-\bar{y})^2}}$, lies in the range of [-1.1], Correlation distance = 1 - Correlation
      3. Hamming Distance = % Disagreement, say U1: 3,3,5,2,1; U2: 4,5,2,2,1; 60%

### Latent Factor Analysis

1. Analogous to PCA(Principal Components Analysis)
2. turn user-product ratings matrix into 2 matrix
   1. Users(row)-Factors(col) -> Pu
   2. Factors(row)-Products(col) -> Qi
   3. $r_{ui} = p_u.q_i$
   4. $min \sum((r_{ui}-p_u.q_i)^2 + \lambda(||p_u||^2+||q_i||^2))$
   regularization term with regularization factor
   standard optimization problem

### Association Rules Learning

#### Market Basket Analysis:
1. What items are bought together in a transaction?
2. What items are bought by a user in a short period of time?

#### Conditional Probabilities
Association Rule: Does a person buying smartphone increase the likelihood of buying a headphone?

#### measuring Rule Strength

1. Support - how a product or a group of products are sold independently, Likelihood of all items in the rule being in a single transaction
2. Confidence - the likelihood of products being sold together rather than individually, likelihood of second item being bought once the first is bought
3. Lift - the delta between support and confidence, change in likelihood of second item being bought once the first is bought

1% buyers bought headphone and mobile together -> support is 1%

out of all transactions with mobile, how many include headphone? P(headphone/mobile) = 5% -> confidence is 5%

P(headphone/mobile) = P(headphone,mobile)/P(mobile)
Conf(headphone/mobile) = Supp(headphone,mobile)/Supp(mobile)

How much does the likelihood of buying headphone increase when mobile is bought? - measured using LIFT

P(headphone) = 3%
P(headphone/mobile) = 5%
Lift(mobile=>headphone) = P(headphone/mobile)/P(headphone) = Conf(headphone/mobile)/Supp(mobile) = 1.67

#### Apriori Algorithm
1. Brute Force
   1. find all possible 2 item sets to generate 2 rules
   2. find all possible N item sets to generate N rules
2. Apriori Algorithm
   1. Prine the number of items in each stage
   2. Use metrics(of support and confidence) to check how important an item set is

#### Steps for Apriori Algorithm

1. Find 1 item sets - keep only those with a minimum support
2. Find 2 item sets - Use only the items left from previous step, keep only item sets with minimum support
3. Generate 2 item rules - Keep only those with a minimum confidence
4. Find 3 item sets - Use only the items left from previous step, Keep only item sets with minimum support
5. Generate 3 item rules - Keep only those with a minimum confidence

#### steps for Association Rule Learning

1. Setup the data - [dataset-lost](https://wiki.csc.calpoly.edu/datasets/wiki/ExtendedBakery),[dataset1](https://github.com/Stocco/Data-Mining-the-Extended-Bakery),[dataset2](https://github.com/ngjiawaie/Extended_Bakery_Dataset),[brief](http://users.csc.calpoly.edu/~dekhtyar/466-Spring2009/labs/extendedBakery.pdf)
2. Compute the support - setup a function to compute support for any items
3. Implement the Apriori Algorithm




