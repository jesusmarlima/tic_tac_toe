class App extends React.Component {

  render() {
    console.log('props', this.props)
    return (
      <Game game_id={this.props.game_id}/>
    )
  }
}
