class AppFive extends React.Component {

  render() {
    console.log('props', this.props)
    return (
      <GameFive game_id={this.props.game_id}/>
    )
  }
}
