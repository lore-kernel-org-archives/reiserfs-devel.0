From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: Re: reiserfs3, rsync and hardlinks
Date: Wed, 9 Feb 2005 09:22:21 +0100
Message-ID: <20050209092221.6677b6b2@polo.concept-micro.com>
References: <20050206034102.3956432d@polo.concept-micro.com>
	<1107771769.9024.119.camel@tribesman.namesys.com>
	<20050207215036.39ca391c@polo.concept-micro.com>
	<1107861403.9024.161.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1107861403.9024.161.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le mar 08 f=E9v 2005 14:16:43 CET, Vladimir Saveliev <vs@namesys.com> a =E9=
crit
:

> > > You can try to make reiserfs to not free inode numbers of removed
> > > files with the attached patch and check whether it helps. It decreases
> > > number of files which can be created on a filesystem to ~2^^32.
> > > I am not sure if it is enough for low traffic IMPA server.
> >=20
> > Ok, I can probably try this hack to verify the hypothesis.=20
>=20
> Yes, please do that.

Worked fine this night, but I will keep it running some more (they were many
mrtg test processes stuck for a reason I couldn't determine, rebooting
cleaned them up, I hope this didn't influence the test result...)

Best regards,
Pierre.
