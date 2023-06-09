import React, { useEffect, useState } from "react";
import { StyleSheet } from "react-native";
import { Text } from "react-native";
import { View } from "react-native";
import axios from "axios";
import { apiUrl } from "../../helper";


export default function Order({orderID}) {
  const[order, setOrder] = useState([]);
  const [total, setTotal] = useState(0);
  const [status, setStatus] = useState("");
  const [refresh, setRefresh] = useState(true);
  const [c, setC] = useState(true);

  useEffect(() => {
    axios.get(apiUrl + "/orderList/" + orderID)
    .then( res => {
      setOrder(res.data.orders)
      setStatus(res.data.orders[0].order_status);
      if(c){
        let totalPrice = 0;
        res.data.orders.map( o => {
          
          totalPrice += o.price;
          
        });
        // console.log(totalPrice);
        setTotal(totalPrice);
        setC(false);
      }
      
    })
    .catch(e => {
      console.log(e);
    })
  }, [refresh]);

  setTimeout( ()=> {
    setRefresh(!refresh);
    // console.log(refresh);
  }, 3000);

  return (
    <View style={styles.container}>
      <View>
        <Text>Order#</Text>
        <Text>{orderID}</Text>
      </View>
      <View>
        <Text>Description</Text>
        {order.map( o => <Text key={o.id}>{o.product_name} x {o.qty}</Text>)}
        <Text>Total </Text>
      </View>
      <View>
        <Text>Price</Text>
        {order.map( o => <Text key={o.id}>{o.price}</Text>)}
        <Text>{total}</Text>
      </View>
      <View>
        <Text>Status</Text>
        <Text >{status}</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: "row",
    justifyContent: "space-evenly",
    borderRadius: 5,
    borderColor: "#ff8c52",
    borderWidth: 2,
    margin: 10,
    // height: 100,
    paddingVertical: 15,
  },
});
