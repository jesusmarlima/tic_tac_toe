class LinkToUser extends React.Component{
  render(){
    return(
      <a href={"/users/" + this.props.game_id} >see my stats</a>
    )
  }
}
