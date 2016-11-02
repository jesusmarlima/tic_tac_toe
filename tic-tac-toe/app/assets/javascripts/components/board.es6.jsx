class Board extends React.Component {

  constructor() {
    super();
    this.state = {
      squares: Array(9).fill(null),
      xIsNext: true,
    };
  }

  handleClick(i) {
    const squares = this.state.squares.slice();

    if (this.calculateWinner(squares) || squares[i]) {
      return;
    }

    squares[i] = 'X';

    var squere_obj = {squares : squares}
    $.ajax({
      url: '/games/computer_move/' + this.props.game_id,
      method: 'POST',
      data: squere_obj
    }).done((response) => {
      this.setState({
        squares: response
      })
    })
  }

  renderSquare(i) {
    return <Square value={this.state.squares[i]} onClick={() => this.handleClick(i)} />;
  }

  renderLinkTo(status) {
    if(status){
      return <LinkToUser game_id={this.props.game_id}/>
    }
  }

  calculateWinner(squares) {
    // debugger;
    // if (!squares.indexOf(null)) {
    //   return "tie"
    // }
  const lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];
  for (let i = 0; i < lines.length; i++) {
    const [a, b, c] = lines[i];
    if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
      return squares[a];
    }
  }
  return null;
}

  save_game(winner){
    var game_result = {winner : winner}
    $.ajax({
      url: '/games/save/' + this.props.game_id,
      method: 'POST',
      data: game_result
    }).done((response) => {

    })
  }


  render() {

    const winner = this.calculateWinner(this.state.squares);
    let status;
    if (winner) {
      this.save_game(winner)
      status = 'Winner: \n' + winner;
    }
    return (
      <div>
        <div className="status">{status}</div>
        <div className="status">{this.renderLinkTo(status)}</div>
        <div className="board-row">
          {this.renderSquare(0)}
          {this.renderSquare(1)}
          {this.renderSquare(2)}
        </div>
        <div className="board-row">
          {this.renderSquare(3)}
          {this.renderSquare(4)}
          {this.renderSquare(5)}
        </div>
        <div className="board-row">
          {this.renderSquare(6)}
          {this.renderSquare(7)}
          {this.renderSquare(8)}
        </div>
      </div>
    );
  }
}
