import { Button } from "@rneui/themed";
import React, { useEffect, useState, useContext } from "react";
import { View, Text, FlatList, StyleSheet, Alert } from "react-native";
import axios from "axios";
import { CartContext } from "../context/CartContext";
import { apiUrl } from "../../helper";


export function Cart({ navigation }) {
  const { items, getItemsCount, getTotalPrice, clearCart, userID, shopID } =
    useContext(CartContext);
  const [msg, setMsg] = useState(false);

  
  function Totals() {
    let [total, setTotal] = useState(0);
    useEffect(() => {
      setTotal(getTotalPrice());
    });
    return (
      <View style={styles.cartLineTotal}>
        <Text style={[styles.lineLeft, styles.lineTotal]}>Total</Text>
        <Text style={styles.lineRight}>৳ {total}</Text>
      </View>
    );
  }

  function renderItem({ item }) {
    return (
      <View>
        <View style={styles.cartLine}>
          <Text style={styles.lineLeft}>
            {item.product.product_name} x {item.qty}
          </Text>
          <Text style={styles.lineRight}>৳ {item.totalPrice}</Text>
        </View>
      </View>
    );
  }

  const handlePlaceOrder = async ()=>{
    // console.log(userID);
    // console.log(shopID);
    // console.log(items);
    let data = {
      userID,
      shopID,
      items
    }
    let res;
    try {
      res = await axios.post(apiUrl + "/postOrder", {data});
    } catch (error) {
      console.log(error);
    }
    setMsg(true);
    clearCart();
    
  } 


  return (
    <View>
      <FlatList
        style={styles.itemsList}
        contentContainerStyle={styles.itemsListContainer}
        data={items}
        renderItem={renderItem}
        keyExtractor={(item) => item.id.toString()}
        ListFooterComponent={Totals}
      />
      <Button
        title="Place order"
        color="#ff8c52"
        onPress={handlePlaceOrder}
      ></Button>
      <Button
        title="Clear Cart"
        color="red"
        onPress={ () => clearCart()}
      ></Button>
      {msg && <Text>Your order has been placed</Text>}
    </View>
  );
}

const styles = StyleSheet.create({
  cartLine: {
    flexDirection: "row",
  },
  cartLineTotal: {
    flexDirection: "row",
    borderTopColor: "#dddddd",
    borderTopWidth: 1,
  },
  lineTotal: {
    fontWeight: "bold",
  },
  lineLeft: {
    fontSize: 20,
    lineHeight: 40,
    color: "#333333",
  },
  lineRight: {
    flex: 1,
    fontSize: 20,
    fontWeight: "bold",
    lineHeight: 40,
    color: "#333333",
    textAlign: "right",
  },
  itemsList: {
    backgroundColor: "#eeeeee",
  },
  itemsListContainer: {
    backgroundColor: "#eeeeee",
    paddingVertical: 8,
    marginHorizontal: 8,
  },
});
