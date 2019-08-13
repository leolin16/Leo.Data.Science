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
   2. extract rating(explicit or implicit) for per user per product
   3. get rating matrix with user as y axis and products as x axis
   4. fill in the blank cells(product with no user rating) with ML techniques (nearest neighbor model - use the ratings of "most similar" users/latent factor analysis - solve for underlying factors that drive the ratings)
      1. measure distance of users
         1. Euclidean Distance(physical distance), x is dimension 1, y is dimension 2: $\sqrt{(x_2-x_1)^2+(y_2-y_1)^2+...[nth]}$
         2. Correlation Distance: how in sync the variations or deviations from the mean are for each of the value, x is value of each dimension for the first element, y is value of each dimension for the second element: $$
         3. Hamming Distance
3. Find complementary products(above 2 are substitutable for each other, while here is complementary) - association rules learning
   1. Conditional Probabilities
   2. Help create offers for buyers of a certain product

### types


## Setup

1. anaconda [ref](http://deeplearning.lipingyang.org/2018/12/25/conda-commands-create-virtual-environments-for-python-with-conda/)
   1. create virtual env: `conda create -n [env name] python=[version] [packages separate by space, eg: anaconda]`
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
2. scikit-surprise
   1. conda install -c conda-forge scikit-surprise
3. materials
   1. [download](https://sundog-education.com/recsys/)

$a+b=c$
$$
f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi \xi x} \,d\xi
$$