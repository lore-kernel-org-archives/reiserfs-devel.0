From: "Dongxu Ma" <dongxu.ma@gmail.com>
Subject: script binding for reiserfs?
Date: Thu, 6 Apr 2006 16:23:52 +0800
Message-ID: <9bc0d5d20604060123v18c5518cmb072472ec56d8fe0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_22227_12026026.1144311832346"
Return-path: <reiserfs-list-return-28454-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_Part_22227_12026026.1144311832346
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi all,

As reiserfs more and more popular, is there any binding package for use in
script languages? I did a search on Google and nothing found.
Curently I am thinking about writing a binding for Perl, which can offer:
1) script-level operation against reiserfs
2) DBI && DBD for reiserfs binding to treat the fs as a database. My aim is
constructing a mid-and-small wiki directly on reiserfs without employing an=
y
real database

However, after some seeking on source. I got several issues:
1) is there any so-called official userspace api exported?
On gentoo there is a package named progsreiserfs introducing an api set
under /usr/include/reiserfs, but I am not very sure if it is stable and the
project is still alive.

2) regarding reiser3, where could I start to port? since exporting somethin=
g
in kernelspace is quite risky.

Any advice and hint?

--
Cheers, Dongxu
__END__
dongxu.wordpress.com
search.cpan.org/~dongxu

------=_Part_22227_12026026.1144311832346
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi all,<br><br>As reiserfs more and more popular, is there any binding pack=
age for use in script languages? I did a search on Google and nothing found=
.<br>Curently I am thinking about writing a binding for Perl, which can off=
er:
<br>1) script-level operation against reiserfs<br>2) DBI &amp;&amp; DBD for=
 reiserfs binding to treat the fs as a database. My aim is constructing a m=
id-and-small wiki directly on reiserfs without employing any real database
<br><br>However, after some seeking on source. I got several issues:<br>1) =
is there any so-called official userspace api exported? <br>On gentoo there=
 is a package named progsreiserfs introducing an api set under /usr/include=
/reiserfs, but I am not very sure if it is stable and the project is still =
alive.
<br><br>2) regarding reiser3, where could I start to port? since exporting =
something in kernelspace is quite risky. <br><br>Any advice and hint?<br cl=
ear=3D"all"><br>-- <br>Cheers, Dongxu<br>__END__<br><a href=3D"http://dongx=
u.wordpress.com">
dongxu.wordpress.com</a><br><a href=3D"http://search.cpan.org/~dongxu">sear=
ch.cpan.org/~dongxu</a>

------=_Part_22227_12026026.1144311832346--
