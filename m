From: Konstantin Besch <forward@zagon.com>
Subject: Re: if xml-DB possible on Reiser4 - would be also SQL?
Date: Tue, 10 Aug 2004 21:23:41 -0400
Message-ID: <200408102123.41160.forward@zagon.com>
References: <41188B66.2010609@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20166-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41188B66.2010609@gmx.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com, ulenrich@gmx.de

I am interested in precisely the same development idea.
Looked at mysql and pgsql to share and (possibly?) map their table structure
into regular fs system. Since I like perl my examples looked as following :

simple select - "SELECT * from x_table WHERE x_field LIKE 'foo' " operation=
 ,=20
written in perl would look like :
"while (x_table::xfield =3D~ /foo/){print;}"

assuming you have x_table mapped as /my_db/x_table file in the fs.

pgsql looks more promising , since to run complex queries you would still n=
eed=20
to use pgsql's query optimizer and so on.=20
So , the solution is either translation of filesystem calls into sql=20
statements (which is really inefficient ) or writing a special=20
client-connector for pgsqld and to use their internal (hopefully shared)=20
functionality to meet the goal.
Although to sql translation would be more universal , I doubt it is worth t=
he=20
trouble writing. This is the reply I got from Ken , developer of SQLFairy=20
group (they wrote tool to translate different SQL's into each other) :
" What you want would first require a substantial amount of work to add =A0=
to=20
our existing grammars all the rules for parsing mutation statements =A0for =
each=20
vendor, and then you could create some sort of Perl Producer =A0class to cr=
eate=20
your output. =A0It's not impossible, of course, and we'd =A0be happy if you=
 want=20
to contribute this. =A0I will admit that I'm =A0somewhat skeptical, however=
 I've=20
been wrong about other suggestions to =A0the project in the past. =A0I gues=
s I'm=20
generally satisfied with SQL. =A0 It's a handy domain-specific language tha=
t is=20
generally standardized =A0and portable, so I can't imagine wanting to rewri=
te=20
SQL in Perl. =A0If =A0this is something you'd like to see in SQL::Translato=
r,=20
you'll likely =A0have to write it. =A0:-) ".
I have downloaded Reiser4 and looking at the plugin code. PGsql has=20
interesting feature called "PL/Perl", maybe it is going to be enough ( for=
=20
now) to do what I need.=20

												--Sincerely , Dean

On Tuesday 10 August 2004 4:46 am, Ralph wrote:
> Would it be possible to write a SQL-plugin for Reiser4 with all
> typicall SQL CONSTRAINTs (foreignkeys, triggers ...etc)?
>
> Thus data integrity a SQL-database despite a filesystem provides
> and a (Ms)WinFS like system could be realised.
>
> After writing some data with a SQL-client, you could retrieve
> a pieces of data through the filesystem interface, like:
> # cat ../my_databasename/my_schema/my_table/my_friend/his_email
>
> The features of "Reiser4 Atomic Filesystem" would enable
> SQL-Transactions when inserting data through a SQL-client.
