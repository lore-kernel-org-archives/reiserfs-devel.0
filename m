From: Ralph <eulenreich@gmx.de>
Subject: if xml-DB possible on Reiser4 - would be also SQL?
Date: Tue, 10 Aug 2004 10:46:30 +0200
Message-ID: <41188B66.2010609@gmx.de>
Reply-To: ulenrich@gmx_de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20121-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Would it be possible to write a SQL-plugin for Reiser4 with all
typicall SQL CONSTRAINTs (foreignkeys, triggers ...etc)?

Thus data integrity a SQL-database despite a filesystem provides
and a (Ms)WinFS like system could be realised.

After writing some data with a SQL-client, you could retrieve
a pieces of data through the filesystem interface, like:
# cat ../my_databasename/my_schema/my_table/my_friend/his_email

The features of "Reiser4 Atomic Filesystem" would enable
SQL-Transactions when inserting data through a SQL-client.




