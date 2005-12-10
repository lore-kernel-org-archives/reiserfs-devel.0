From: Nate Diller <nate.diller@gmail.com>
Subject: Re: Two usage examples for attribute directories.
Date: Fri, 9 Dec 2005 17:11:55 -0800
Message-ID: <5c49b0ed0512091711y8b13c46lcbe627e28c708f95@mail.gmail.com>
References: <200511201317.12598.pvh@uvic.ca> <200512021649.54939.pvh@uvic.ca>
	 <43917967.4080008@st-andrews.ac.uk> <200512042027.16525.pvh@uvic.ca>
	 <43983F5E.3080704@st-andrews.ac.uk>
	 <87hd9jqq4d.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_9111_33351075.1134177115379"
Return-path: <reiserfs-list-return-27246-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87hd9jqq4d.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

------=_Part_9111_33351075.1134177115379
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 12/8/05, Hubert Chan <hubert@uhoreg.ca> wrote:
>
> On Thu, 08 Dec 2005 14:12:46 +0000, Peter Foldiak said:
>
> [...]
>
> > You say "author" should be an attribute but "icon.png" is not an
> > attribute. I am not convinced they should be treated differently.  The
> > listing doesn't look ugly to me at all (just because it is long).
>
> IMHO, putting attributes in foo/ instead of foo/@/ increases the risk of
> collisions.  e.g. let's say I have a directory that contains a file
> named icon.png, but I want my file manager to display its icon as some
> other file.  If all the attributes are in foo/, then the file manager
> will read foo/icon.png as the directory's icon, which is not what I
> want.  It would be better if I could have a directory that contains
> icon.png, and uses foo/@/icon.png as its icon in the file manager.
>

This problem is already solved.

$ ls /home/nate
icon.png

$ ls -a /home/nate
.
..
.bash_rc
icon.png

so...

$ls -aa /home/nate
.
..
..icon.png
.bash_rc
icon.png

this works for PvH's example too:
$ ls -aa app/
.
..
..author
..category
..contact
..description
..name
..version
.config
.default_options
bin
lib
src
var
Makefile
icon.png
install.sh

NATE

------=_Part_9111_33351075.1134177115379
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 12/8/05, <b class=3D"gmail_sendername">Hubert Chan</b> &lt;<a href=3D"ma=
ilto:hubert@uhoreg.ca">hubert@uhoreg.ca</a>&gt; wrote:<div><span class=3D"g=
mail_quote"></span><blockquote class=3D"gmail_quote" style=3D"border-left: =
1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;=
">
On Thu, 08 Dec 2005 14:12:46 +0000, Peter Foldiak said:<br><br>[...]<br><br=
>&gt; You say &quot;author&quot; should be an attribute but &quot;icon.png&=
quot; is not an<br>&gt; attribute. I am not convinced they should be treate=
d differently.&nbsp;&nbsp;The
<br>&gt; listing doesn't look ugly to me at all (just because it is long).<=
br><br>IMHO, putting attributes in foo/ instead of foo/@/ increases the ris=
k of<br>collisions.&nbsp;&nbsp;e.g. let's say I have a directory that conta=
ins a file
<br>named icon.png, but I want my file manager to display its icon as some<=
br>other file.&nbsp;&nbsp;If all the attributes are in foo/, then the file =
manager<br>will read foo/icon.png as the directory's icon, which is not wha=
t I<br>
want.&nbsp;&nbsp;It would be better if I could have a directory that contai=
ns<br>icon.png, and uses foo/@/icon.png as its icon in the file manager.<br=
></blockquote></div><br>
This problem is already solved.<br>
<br>
$ ls /home/nate<br>
icon.png<br>
<br>
$ ls -a /home/nate<br>
.<br>
..<br>
.bash_rc<br>
icon.png<br>
<br>
so...<br>
<br>
$ls -aa /home/nate<br>
.<br>
..<br>
..icon.png<br>
.bash_rc<br>
icon.png<br>
<br>
this works for PvH's example too:<br>
$ ls -aa app/<br>
.<br>
..<br>
..author<br>
..category<br>
..contact<br>
..description<br>
..name<br>
..version<br>
.config<br>
.default_options<br>
bin<br>
lib<br>
src<br>
var<br>
Makefile<br>
icon.png<br>
install.sh<br>
<br>
NATE<br>

------=_Part_9111_33351075.1134177115379--
