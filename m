From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: ReiserFS corruption with samba 3.0.2a
Date: Wed, 18 Feb 2004 18:33:47 +0100
Message-ID: <Sea2-DAV66JL947FR7m000009bc@hotmail.com>
References: <Sea2-DAV22IBirXXeQM0000aeb5@hotmail.com><87fzd8tx0q.fsf@dps11.gnuyork.org><Sea2-DAV63halxyPyF100008503@hotmail.com> <87smh8tmts.fsf@dps11.gnuyork.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16832-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Billy O'Connor <billyoc@gnuyork.org>
Cc: Tomas Szepe <szepe@pinerecords.com>, Nikita Danilov <Nikita@Namesys.COM>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Billy O'Connor wrote:

> "Marco Berizzi" <pupilla@hotmail.com> writes:
>=20
> >> > I'm experimenting this problem with samba 3.0.2a and linux 2.4.24
> >> > with ReiserFS. When I copy (put) a large file (5GB) from a =
Windows NT
> >> > terminal server edition sp6a machine to the samba-linux box I get =
this
> >> > error:
> >> >
> >> > Feb 17 18:01:11 Mimas kernel: ide0(3,8):vs-4080: =
reiserfs_free_block: free_block (0308:4999052)[dev:blocknr]: bit already =
cleared
> >> > Feb 17 18:01:11 Mimas kernel: ide0(3,8):vs-4080: =
reiserfs_free_block: free_block (0308:4997935)[dev:blocknr]: bit already =
cleared
> >> > Feb 17 18:02:48 Mimas kernel: ide0(3,8):vs-4080: =
reiserfs_free_block: free_block (0308:902445)[dev:blocknr]: bit already =
cleared
> >> > Feb 17 18:02:48 Mimas kernel: ide0(3,8):vs-4080: =
reiserfs_free_block: free_block (0308:902286)[dev:blocknr]: bit already =
cleared
> >> >
> >> > Samba 2.2.8a doesn't show this behaviour.
> >>=20
> >> Do any other windows clients exhibit this behavior?
> >
> > Sorry for the late response. I have tried with Windows 2000 and the =
copy
> > operation was ok.
>=20
> Oh, boy, that's a problem for me, I don't have NT.  Have you posted
> this problem to the samba mailing list?  I'm sure they'd want to hear
> about it.

No. I haven't posted. I have just rebooted the
linux box.
Now this error doesn't appear anymore.
The only relevant thing is that yesterday there
were samba 2.2.8a running on this Slackware linux
box.
Then I stopped & removed the samba 2.2.8a package.
I haven't rebooted the system. I have updated and
started samba 3.0.2a. Here I got the ReiserFS problem
coping a file from NT ---> to samba 3.0.2a box.
Now I'm keeping an eye on this system.
