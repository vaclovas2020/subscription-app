import React from "react"
import PropTypes from "prop-types"
class Product extends React.Component {
  render () {
    return (
      <div>
        <span style={{ marginRight: '0.5em', paddingRight: '0.5em', borderRight: '1px solid rgba(0,0,0,0.2)'}}>Id: {this.props.id}</span>
        <span>Title: {this.props.title}</span>
      </div>
    );
  }
}

Product.propTypes = {
  id: PropTypes.number,
  title: PropTypes.string
};
export default Product
