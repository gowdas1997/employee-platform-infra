########################################
# Public Route Table Associations
########################################

resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public.id
}

########################################
# Private App Route Table Associations
########################################

resource "aws_route_table_association" "private_app_subnet_1" {
  subnet_id      = aws_subnet.private_app_subnet_1.id
  route_table_id = aws_route_table.private_app.id
}

resource "aws_route_table_association" "private_app_subnet_2" {
  subnet_id      = aws_subnet.private_app_subnet_2.id
  route_table_id = aws_route_table.private_app.id
}

########################################
# Private DB Route Table Associations
########################################

resource "aws_route_table_association" "private_db_subnet_1" {
  subnet_id      = aws_subnet.private_db_subnet_1.id
  route_table_id = aws_route_table.private_db.id
}

resource "aws_route_table_association" "private_db_subnet_2" {
  subnet_id      = aws_subnet.private_db_subnet_2.id
  route_table_id = aws_route_table.private_db.id
}