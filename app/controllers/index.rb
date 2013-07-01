

get '/' do
  # Look in app/views/index.erb
  @notes = Note.all
  erb :index
end

get '/create' do
  erb :create_note

end

post '/create' do

  Note.create(params)
  @notes = Note.all

  erb :index
end

get '/read/:id' do

  @one_note = Note.find(params[:id])
  erb :read_note

end

get '/update/:id' do

  @note = Note.find(params[:id])
  erb :update_note

end

post '/update' do

  note = Note.find(params[:id])
  note.title = params[:title]
  note.content = params[:content]
  note.save
  @notes = Note.all

  erb :index

end


get '/delete/:id' do

  Note.destroy(params[:id])
  @notes = Note.all

  # if Note.empty?
  #   Note.reset_pk_sequence
  # end
  erb :index

end

