<?php include('common/header.php'); ?>
<?php
	$title=$_GET['title'];
	$id=(int)$_GET['threadid'];
	$topicId=(int)$_GET['topicid'];
	$topictitle=$_GET['topictitle'];
?>
<div class="row">
	<div class="col-md-12">
		<ul class="breadcrumb">
			<li><a href="index.php">Home</a></li>
			<li><a href="threads.php?topicid=<?php echo $topicId; ?>&title=<?php echo $topictitle; ?>">Threads</a></li>
			<li><a href="posts.php?topicid=<?php echo $topicId; ?>&topictitle=<?php echo $topictitle; ?>&title=<?php echo $title; ?>&threadid=<?php echo $id; ?>"><?php echo $title; ?></a></li>
			<li class="active">Add Post</li>
		</ul>
	</div>
</div>
			<!-- Content Start -->
			<div class="row">
				<div class="col-md-12">
					<?php
						// Add Post
						if(isset($_POST['addPost'])){
							$title=mysqli_escape_string($con,$_POST['title']);
							$description=mysqli_escape_string($con,$_POST['description']);
							$video=mysqli_escape_string($con,$_POST['video']);
							if(empty($title) || empty($description) || empty($video)){
								echo _warning('Enter required fields!!');
							}else{
								$data=array();
								$data['id']=$id;
								$data['title']=$title;
								$data['description']=$description;
								$data['video']=$video;
								$data['added_by']=$_SESSION['userData']['user_id'];
								$res=add_post($id,$data);
								if($res['bool']==true){
									echo _success($res['msg']);
								}else{
									echo _error($res['msg']);
								}
							}
						}
					?>
					<div class="panel panel-success">
						<div class="panel-heading">Add Post In "<?php echo $title; ?>"
							<span>
								<a href="posts.php?topicid=<?php echo $topicId; ?>&topictitle=<?php echo $topictitle; ?>&title=<?php echo $title; ?>&threadid=<?php echo $id; ?>" class="white-text pull-right"><i class="fa fa-long-arrow-left"></i> Post List</a>
							</span>
						</div>
						<div class="panel-body thread-container">
							<form action="" method="post">
								<table class="table table-bordered">
									<tr>
										<th>Title <i class="fa fa-asterisk text-danger"></i></th>
										<td><input type="text" class="form-control" name="title" /></td>
									</tr>
									<tr>
										<th>Description <i class="fa fa-asterisk text-danger"></i></th>
										<td><textarea class="form-control" name="description"></textarea></td>
									</tr>
									<tr>
										<th>Video Link <i class="fa fa-asterisk text-danger"></i></th>
										<td><input type="url" class="form-control" name="video"></textarea></td>
									</tr>
									<tr>
										<td colspan="2">
											<input type="submit" class="btn btn-warning" value="Add Post" name="addPost" />
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- Content End -->
<?php include('common/footer.php'); ?>