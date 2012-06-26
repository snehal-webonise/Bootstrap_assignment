class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def myform
    @post = Post.new

    respond_to do |format|
      format.html # myform.html.erb
      format.json { render :json => @post }
    end

  end

  def mycreate
    @post = Post.create_new_entry(params[:post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, :notice => 'Data was successfully created.' }
      else
        format.html { render :action => "myform" }
      end
    end
  end

  def mydelete
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path }
    end
  end

  def myedit
    @post = Post.find(params[:id])
  end

  def myupdate
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to posts_path, :notice => 'Post was successfully updated.' }
      else
        format.html { render :action => "myedit" }
      end
    end
  end

  def myshowdata
    @post = Post.find(params[:id])
    @comments = @post.posts_comments
    @comment = @post.posts_comments.new
    respond_to do |format|
      format.html # myshowdata.html.erb
    end
  end

  def create_comment
    @post = Post.find(params[:id])
    @new_comment = @post.posts_comments.new(params[:posts_comment])
    @new_comment.save
    @comments = @post.posts_comments
    logger.info @comments.inspect
    respond_to do |format|
      format.js
    end
  end
end
