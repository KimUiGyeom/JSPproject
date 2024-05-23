<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bootstrap Carousel with 3 Items per Slide in JSP</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <!-- Slide 1 -->
    <div class="carousel-item active">
      <div class="row">
        <div class="col-md-4 mb-3">
          <div class="card">
            <img src="<%=request.getContextPath()%>/images/image1.jpg" class="card-img-top" alt="Image 1">
            <div class="card-body">
              <h5 class="card-title">Card 1</h5>
              <p class="card-text">Description for card 1.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <div class="card">
            <img src="<%=request.getContextPath()%>/images/image2.jpg" class="card-img-top" alt="Image 2">
            <div class="card-body">
              <h5 class="card-title">Card 2</h5>
              <p class="card-text">Description for card 2.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <div class="card">
            <img src="<%=request.getContextPath()%>/images/image3.jpg" class="card-img-top" alt="Image 3">
            <div class="card-body">
              <h5 class="card-title">Card 3</h5>
              <p class="card-text">Description for card 3.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Slide 2 -->
    <div class="carousel-item">
      <div class="row">
        <div class="col-md-4 mb-3">
          <div class="card">
            <img src="<%=request.getContextPath()%>/images/image4.jpg" class="card-img-top" alt="Image 4">
            <div class="card-body">
              <h5 class="card-title">Card 4</h5>
              <p class="card-text">Description for card 4.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <div class="card">
            <img src="<%=request.getContextPath()%>/images/image5.jpg" class="card-img-top" alt="Image 5">
            <div class="card-body">
              <h5 class="card-title">Card 5</h5>
              <p class="card-text">Description for card 5.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <div class="card">
            <img src="<%=request.getContextPath()%>/images/image6.jpg" class="card-img-top" alt="Image 6">
            <div class="card-body">
              <h5 class="card-title">Card 6</h5>
              <p class="card-text">Description for card 6.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Slide 3 -->
    <div class="carousel-item">
      <div class="row">
        <div class="col-md-4 mb-3">
          <div class="card">
            <img src="<%=request.getContextPath()%>/images/image7.jpg" class="card-img-top" alt="Image 7">
            <div class="card-body">
              <h5 class="card-title">Card 7</h5>
              <p class="card-text">Description for card 7.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <div class="card">
            <img src="<%=request.getContextPath()%>/images/image8.jpg" class="card-img-top" alt="Image 8">
            <div class="card-body">
              <h5 class="card-title">Card 8</h5>
              <p class="card-text">Description for card 8.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <div class="card">
            <img src="<%=request.getContextPath()%>/images/image9.jpg" class="card-img-top" alt="Image 9">
            <div class="card-body">
              <h5 class="card-title">Card 9</h5>
              <p class="card-text">Description for card 9.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Slide 4 -->
    <div class="carousel-item">
      <div class="row">
        <div class="col-md-4 mb-3">
          <div class="card">
            <img src="<%=request.getContextPath()%>/images/image10.jpg" class="card-img-top" alt="Image 10">
            <div class="card-body">
              <h5 class="card-title">Card 10</h5>
              <p class="card-text">Description for card 10.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <div class="card">
            <img src="<%=request.getContextPath()%>/images/image11.jpg" class="card-img-top" alt="Image 11">
            <div class="card-body">
              <h5 class="card-title">Card 11</h5>
              <p class="card-text">Description for card 11.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <div class="card">
            <img src="<%=request.getContextPath()%>/images/image12.jpg" class="card-img-top" alt="Image 12">
            <div class="card-body">
              <h5 class="card-title">Card 12</h5>
              <p class="card-text">Description for card 12.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>

</body>
</html>
