class BoardFive extends React.Component {

  constructor() {
    super();
    this.state = {
      squares: Array(25).fill(null),
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
      url: '/games/computer_move_five/' + this.props.game_id,
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
    [0,  1,  2,  3, 4],
    [5,  6,  7,  8, 9],
    [10, 11, 12,13,14],
    [15, 16, 17,18,19],
    [20, 21, 22,23,24],

    [0, 5 , 10, 15, 20],
    [1, 6 , 11, 16, 21],
    [2, 7,  12, 17, 22],
    [3, 8,  13, 18, 23],
    [4, 9,  14, 19, 24],

    [0, 6 , 12, 18, 24],
    [4, 8 , 12, 16, 20]

  ];

  if(this.checkTie(squares) === 'Tie'){
      return "Computer wins the tie, second place is just the first loser! "
  }

  for (let i = 0; i < lines.length; i++) {
    const [a, b, c, d, e] = lines[i];
    if (squares[a] &&
        squares[a] === squares[b] &&
        squares[a] === squares[c] &&
        squares[a] === squares[d] &&
        squares[a] === squares[e]) {
      return squares[a];
    }
  }

  return null;
}

  checkTie(squares){
    if (squares.indexOf(null) >= 0){
      return ""
    } else if (squares.indexOf("") === -1)
      return 'Tie'
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
          {this.renderSquare(3)}
          {this.renderSquare(4)}

        </div>
        <div className="board-row">
          {this.renderSquare(5)}
          {this.renderSquare(6)}
          {this.renderSquare(7)}
          {this.renderSquare(8)}
          {this.renderSquare(9)}

        </div>
        <div className="board-row">
          {this.renderSquare(10)}
          {this.renderSquare(11)}
          {this.renderSquare(12)}
          {this.renderSquare(13)}
          {this.renderSquare(14)}
        </div>
        <div className="board-row">
          {this.renderSquare(15)}
          {this.renderSquare(16)}
          {this.renderSquare(17)}
          {this.renderSquare(18)}
          {this.renderSquare(19)}
        </div>
        <div className="board-row">
          {this.renderSquare(20)}
          {this.renderSquare(21)}
          {this.renderSquare(22)}
          {this.renderSquare(23)}
          {this.renderSquare(24)}
        </div>

      </div>
    );
  }
}
