From: Clemens Eisserer <linuxhippy@gmail.com>
Subject: Re: Howto make reiser-3.6 a bit more standby friendly?
Date: Tue, 23 Aug 2005 15:58:55 +0200
Message-ID: <194f6255050823065872f42089@mail.gmail.com>
References: <194f62550508230539a1c81d9@mail.gmail.com>
	 <430B26A1.4080003@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25620-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430B26A1.4080003@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello David and thanks a lot for answering my question.

> Have you tried "-o noatime"?
Why do you think this could help?=20
Since the machine does absolutly nothing (no services, simply nothing
than a open bash).
=20
> Also, Reiser4 is much more standby-friendly.  If you've got the RAM, it
> won't touch your disk too much.
Yes I know - but its a bit too complicated for me to get everything
up&running from ground up using Reiser4 since its not in the
default-kernel of debian :-(

Thanks again, lg Clemens
