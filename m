From: Isaac Claymore <clay@exavio.com.cn>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files according to semantic.
Date: Wed, 17 Mar 2004 10:49:31 +0800
Message-ID: <20040317024931.GB5731@exavio.com.cn>
References: <20040316224523.39093.qmail@web60408.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Return-path: <reiserfs-list-return-17259-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040316224523.39093.qmail@web60408.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: faraz ahmed <faraz_irulz@yahoo.com>
Cc: reiserfs-list@namesys.com

--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'm new to this idea, and am no fs expert. But it looks to me very
much like what Apple is doing on their iPods, I happen to have just
bought one iPod last weekend.

Internally, the audio files are stored on a HFS+ filesystem, under a=20
hierarchy structure very weird to us humans. But, by using iPod or the
iTunes tool, the files are presented under various hierachy structures
organized by file meta data, like artist, album, composer... And, that's
far too convenient.

I guess this kind of stuff can be done in user space, well and
elegantly. Either a specialized application(e.g. iTunes), or some kind
of user space filesystem will do. I also think this is best suited
for storage of multimedia files, which naturelly come with much meta
data. And, I fail to figure out what benefit this can do to regular
system files, like those under /etc, /boot...

HTH~~


-Isaac

On Tue, Mar 16, 2004 at 02:45:23PM -0800, faraz ahmed wrote:
> Hi EveryBody;
> Iam an final year engneering student and as part of
> our final year project we have implemented a
> filesysten which =20
> support more than 1 Directory Structures for the same
> set of files. Each Directory Structure is a XML file
> discribing the directory structure as well as the
> attributes of the Files to be listed under Each
> directory. The file system the mounts this XML file &
> produces the directory listing by querying the FS for
> files which match the criteria. The Project will soon
> be made public under GPL. Following is the abstract.
> Please guide me with your valuable suggestions.
>=20
>=20
> //=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. Idea of our project:
> //=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The aim of this project is to implement a solution
> that provides file-level host-based virtualization
> that provides for better aggregation of
> content/information based on semantics and properties.
> File-system organization today very closely mirrors
> storage paradigms rather than user-access paradigms
> and semantic grouping. All file-system hierarchies are
> containers that are expressed based on their physical
> presence (a separate drive letter on Windows, or a
> particular mount point based on the volume in Unix).=20
> We wish to implement a solution that will allow users
> to organize their files based on their convenience. We
> define this convenience in the following forms:=20
>=20
> The ability to organize the namespace based on certain
> attribute properties (file-system metadata
> virtualization).=20
> Ex Directory Listing as an output of high level
> relational query based on file attributes.
>=20
> The ability to de-link position of a file in the
> hierarchy from its actual storage (file metadata
> virtualization)=20
> Ex Directory Listing as an output of high level
> relational query based on file attributes.
>=20
> The ability to de-link position of a file in the
> hierarchy from its actual storage (file metadata
> virtualization)=20
> Ex Automatically Listing the files with the proper
> attributes in the respective directories. Create &
> forget file system now puts your MP3 file in the right
> folder no matter where they are stored on the disk.
>=20
> The ability to create and manipulate namespaces using
> well-known metaphors (XML schema descriptions and
> schema editors)=20
> Ex. Define the directory structure with directory
> query as an XML file. Mount multiple such directory
> structures (virtualization). There by allowing
> multiple organizational views for the same set of
> files.
>=20
> The ability to continue using the standard metaphors
> for manipulation and access to information
> (file-system kernel API?s), thus maintaining current
> large body of applications unbroken) .
> Ex. Make all this features available as an standard
> file system so existing apps wont fail
>=20
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail - More reliable, more storage, less spam
> http://mail.yahoo.com

--=20

Regards, Isaac
()  ascii ribbon campaign - against html e-mail
/\                        - against microsoft attachments

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAV7y6VKePB8O3zz0RArulAJ96csOLpNZ4aKuQ+0YcAxT5N2Ej6gCfeN9O
+wBGq/lKufntA1WcB0z5bQw=
=+o80
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--

