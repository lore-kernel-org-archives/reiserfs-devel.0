From: "Brian M. Carlson" <sandals@crustytoothpaste.ath.cx>
Subject: Re: plagiarism of reiserfs by Debian
Date: Tue, 22 Apr 2003 01:15:39 +0000
Message-ID: <20030422011539.GC31437@stonewall>
References: <200304181604.28955.vitaly@namesys.com> <3EA17427.7040300@namesys.com> <87ademfifz.fsf@deneb.enyo.de> <87y926jjmj.fsf@lgeyermac.math.lsa.umich.edu> <1050794648.27117.11.camel@rock.grep.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-ripemd160;
	protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Return-path: <reiserfs-list-return-13746-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1050794648.27117.11.camel@rock.grep.be>
Content-Conversion: prohibited
List-Id: <reiserfs-devel.vger.kernel.org>
To: Wouter Verhelst <wouter@grep.be>
Cc: debian-devel@lists.debian.org, debian-legal@lists.debian.org, reiser@namesys.com, reiserfs-list@namesys.com

--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[subscribed to -legal, not to -devel; Cc: accordingly]

On Sun, Apr 20, 2003 at 01:24:09AM +0200, Wouter Verhelst wrote:
> Op za 19-04-2003, om 22:51 schreef Lukas Geyer:
> > the issue seems to be the fix of #152547. If we are not allowed to
> > remove a screenful of advertising from the output of a program, then
> > this unduly restricts the freedom to distribute modified versions.
>=20
> Uhm.
>=20
> From the GPL, section 2:
>=20
>     c) If the modified program normally reads commands interactively
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     when run, you must cause it, when started running for such
      ^^^^^^^^

I tried mkreiserfs out (I use good old ext2!) and the only "command" it
reads interactively is a "y" or "n" when asked to continue formatting my
test file which is not a block special device.

>     interactive use in the most ordinary way, to print or display an
>     announcement including an appropriate copyright notice and a
>     notice that there is no warranty (or else, saying that you provide
>     a warranty) and that users may redistribute the program under
>     these conditions, and telling the user how to view a copy of this
>     License.  (Exception: if the Program itself is interactive but
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     does not normally print such an announcement, your work based on
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     the Program is not required to print an announcement.)
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Let's assume for a second that the yes-or-no response *is* a command
(which is debatable). GPL 2c only requires that one print or display 1)
a copyright notice; 2) a notice of warranty or the lack thereof; 3) a
notice that redistribution is permitted under the GPL; and 4) how to
view the GPL. It does not require that one spew almost an entire
screenful of advertisement. And, because neither mkreiserfs nor
reiserfsck even display a copyright notice, it falls under the
exception.

> Otherwise put: if the program shows the 'no warranty' clause from the
> GPL at startup, you may not remove it. Although a 'no warranty' message

Which it doesn't.

> messages being printed for legalese reasons. I, personally, see nothing
> wrong with that; it certainly doesn't result in software being non-free.

I do. DFSG 3 requires that "[t]he license must allow modifications and
derived works, and must allow them to be distributed under the same terms
as the license of the original software." GPL 2c passes muster only
because it displays license material. Even that is controversial on this
list. debian-legal has consistently held that license material can be
immutable and still free. I have never seen debian-legal say that
advertisements and conversations with one's lawyer can be immutable and
still free. If you disagree, please show me a reference.

--=20
Brian M. Carlson <sandals@crustytoothpaste.ath.cx> 0x560553e7
"Let us think the unthinkable, let us do the undoable. Let us prepare
 to grapple with the ineffable itself, and see if we may not eff it
 after all." --Douglas Adams

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Ubi libertas, ibi patria.

iQFKBAEBAwA0BQI+pJe7LRpodHRwOi8vZGVjb3kud294Lm9yZy9+Ym1jL29wZW5w
Z3AvcG9saWN5LnRleAAKCRDlkf/JVgVT57eyB/9D1SwEfzLYThiUtyaGBiVdSiGk
MBXwdSOphJv+13ed+SIifBLIpK1uPpv/XENtIX9fItkaa7DusbQg5wYjuSOG0kJ9
flp2Og+fAKZo9PbFeZxJurjzUyOgz/xYjjN3JOa5J7ncwe946haKaR3OUC9PZJgE
XsqKxD9pvbe2Pa1e2+Ok24hqhCarsY91SnSr68BMQ2JhuL1wsN/tLxgI34RJmlll
YMDA4mjF2ngCAnK/UpbAUsocZ1kbXQ5s/M7szwAlScF6aEaxZER6fTfPQ7yG/bCQ
xyBHy7ZRkqa6QtgdQhj0yi2vTxOioIF7jVeXB8GqvTaSA0dLfMldX/xarxaD
=U2ov
-----END PGP SIGNATURE-----
Signature policy: http://decoy.wox.org/~bmc/openpgp/policy.tex

--J5MfuwkIyy7RmF4Q--
