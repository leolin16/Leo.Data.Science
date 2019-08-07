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
   4. fill in the blank cells(product with no user rating) with ML techniques (nearest neighbor model/latent factor analysis)
3. Find complementary products(above 2 are substitutable for each other, while here is complementary) - association rules learning
   1. Conditional Probabilities
   2. Help create offers for buyers of a certain product

### types

1. 