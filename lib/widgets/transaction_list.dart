import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No transactions added yet',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: Image.asset(
                  'assets/image/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                            '₦${transactions[index].amount.toStringAsFixed(2)}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(transactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 450
                      ? FlatButton.icon(
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteTx(transactions[index].id),
                          label: Text('Delete'),
                          textColor: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}

/**
 * Card(child: Row(
children: <Widget>[
Container(
margin: EdgeInsets.symmetric(
vertical: 10,
horizontal: 15,
),
decoration: BoxDecoration(
border: Border.all(
color: Theme.of(context).primaryColor,
width: 2,
)),
child: Text(
'\₦ ${transactions[index].amount.toStringAsFixed(2)}',
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 20,
color: Theme.of(context).primaryColor,
),
),
padding: EdgeInsets.all(10),
),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
Text(
transactions[index].title,
style: Theme.of(context).textTheme.headline6,
),
Text(
//DateFormat('yyyy-MM-dd').format(tx.date),
DateTime.now().toString().substring(0, 10),
style: TextStyle(
fontSize: 12,
color: Colors.blueGrey,
),
)
],
)
],
),
);
 */
