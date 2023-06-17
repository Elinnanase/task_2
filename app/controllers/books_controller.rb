class BooksController < ApplicationController
  def new
  end

def create
  @books = Book.all
  @book = Book.new(book_params)
  if @book.save
    flash[:create] = "Book was successfully created."
    redirect_to book_path(@book.id)
  else
    render :index
  end
end

  def index
      @books = Book.all
      @book = Book.new
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def edit
    @books = Book.all
    @book = Book.find(params[:id])
  end

def update
  @books = Book.all
  @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:update] = "Book was successfully updated."
    redirect_to book_path(@book)
  else
    render :edit
  end
end
  

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    flash[:destroy] = "Book was successfully destroyed."
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end

 private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

