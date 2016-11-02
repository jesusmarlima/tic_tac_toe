class GameFive extends React.Component {
  render() {
    let game_id = this.props.game_id

    return (
      <div className="game">
        <div className="game-board">
          <BoardFive game_id={game_id}/>
        </div>
        <div className="game-info">
          <div>{/* status */}</div>
          <ol>{/* TODO */}</ol>
        </div>
      </div>
    );
  }
}
