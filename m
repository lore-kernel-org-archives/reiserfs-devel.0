From: Gasper Azman <gazman@email.si>
Subject: Re: some testing questions
Date: Mon, 14 Aug 2006 16:07:52 +0200
Message-ID: <44E083B8.1030800@email.si>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig6FE06D874EC113079D4520FE"
Return-path: <reiserfs-list-return-29595-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

--------------enig6FE06D874EC113079D4520FE
Content-Type: multipart/mixed;
 boundary="------------010602020500040804020302"

This is a multi-part message in MIME format.
--------------010602020500040804020302
Content-Type: multipart/alternative;
 boundary="------------080708000603010702060907"


--------------080708000603010702060907
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Vladimir V. Saveliev wrote:
> Hello
>
> On Friday 11 August 2006 21:44, Gasper Azman wrote:
>  =20
>> Hello everyone, especially the namesys team.
>>
>>
>> I have been reading this list for quite some time, and saw that issues=

>> of fragmentation have again arisen. So, a decision was made to put the=

>> portage tree on a separate reiser4 partition, and to benchmark it over=

>> time.
>>
>> Because I know I'm not the smartest guy in the universe, I'm asking
>> everyone here which data they would require (or want to see), how to
>> obtain it (program names would suffice, but other advice will not go
>> amiss) and how frequently the analysis is to be run.=20
>>    =20
>
> reiser4progs incluses a program measurefs.reiser4. It should be able to=
=20
> measure tree fragmentation. I am not sure how does portage tree evolve,=
 but=20
> maybe it could be interesting too see how does reiser4 tree fragmentati=
on=20
> change when filesystem is loaded regularly.
>  =20
Ok. I'm gonna see about the program, and run it after each emerge --sync.=


About the portage tree evolving, it's a lot (~150000) of <2k files, some
never change, and some change very often. New ones are added and old
ones deleted on a similar principle. People have been complaining for
quite some time that, while at first they experienced major speedups
regarding the operation of portage and the rsync process, it slowed to a
halt about half a year afterwards. Some blame fragmentation, and this
may be the key to diagnosing the problem.

Thanks for your help.

Gasper

--------------080708000603010702060907
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"=
>
  <title></title>
</head>
<body bgcolor=3D"#ffffff" text=3D"#000000">
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type">
<title></title>
Vladimir V. Saveliev wrote:
<blockquote cite=3D"mid200608141615.58185.vs@namesys.com" type=3D"cite">
  <pre wrap=3D"">Hello

On Friday 11 August 2006 21:44, Gasper Azman wrote:
  </pre>
  <blockquote type=3D"cite">
    <pre wrap=3D"">Hello everyone, especially the namesys team.


I have been reading this list for quite some time, and saw that issues
of fragmentation have again arisen. So, a decision was made to put the
portage tree on a separate reiser4 partition, and to benchmark it over
time.

Because I know I'm not the smartest guy in the universe, I'm asking
everyone here which data they would require (or want to see), how to
obtain it (program names would suffice, but other advice will not go
amiss) and how frequently the analysis is to be run.=20
    </pre>
  </blockquote>
  <pre wrap=3D""><!---->
reiser4progs incluses a program measurefs.reiser4. It should be able to=20
measure tree fragmentation. I am not sure how does portage tree evolve, b=
ut=20
maybe it could be interesting too see how does reiser4 tree fragmentation=
=20
change when filesystem is loaded regularly.
  </pre>
</blockquote>
Ok. I'm gonna see about the program, and run it after each emerge
--sync.<br>
<br>
About the portage tree evolving, it's a lot (~150000) of &lt;2k files,
some never change, and some change very often. New ones are added and
old ones deleted on a similar principle. People have been complaining
for quite some time that, while at first they experienced major
speedups regarding the operation of portage and the rsync process, it
slowed to a halt about half a year afterwards. Some blame
fragmentation, and this may be the key to diagnosing the problem.<br>
<br>
Thanks for your help.<br>
<br>
Gasper<br>
</body>
</html>

--------------080708000603010702060907--

--------------010602020500040804020302
Content-Type: application/pgp-signature;
 name="signature.asc"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC40IChH
TlUvTGludXgpCkNvbW1lbnQ6IFVzaW5nIEdudVBHIHdpdGggTW96aWxsYSAtIGh0dHA6Ly9l
bmlnbWFpbC5tb3pkZXYub3JnCgppRDhEQlFGRTRJRGtFcFkrVGp6TFJGY1JBckI5QUtDSDAy
NWs2dDdDb1BNR20yZFB3NVplVVRkNGVnQ2VNK25uCkRkd0MxTmF0Q25BcnQ3SFNxUmNBSkhJ
PQo9MDNXTAotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0KCg==
--------------010602020500040804020302--

--------------enig6FE06D874EC113079D4520FE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFE4IO7EpY+TjzLRFcRAnR+AJ0VK1dw4zuQ/XSka/u8sy18ByNEkQCePVHC
A0mQTDfq0YpXdox/7kqAnq4=
=RrM1
-----END PGP SIGNATURE-----

--------------enig6FE06D874EC113079D4520FE--
