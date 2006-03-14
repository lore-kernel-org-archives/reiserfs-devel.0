From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: State of the Reiser4 FS
Date: Tue, 14 Mar 2006 16:32:32 +0100
Message-ID: <194f62550603140732j6ef10757j@mail.gmail.com>
References: <3aa654a40603140241s5d8a7430j6bf29a5ef7dd1bf5@mail.gmail.com>
	 <1142336718.7415.55.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28250-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1142336718.7415.55.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> AFAIK, the most recent reason why reiser4 does not get included is that
> reiser4 developers have to change reiser4 to use generic code to
> implement read/write.
> AFAICS, reiser4 developers do not work on that.
Has this really become a reason to not include reiser4 into mainline?
I also don't see a reason for that - at least it would bind reiser4
more close to linux making ports to other OS harder.
Furthermore if it would decrease performance its simply no way to go.

(btw. I think this could be a way to generate some revenue - I think
there is demand for a modern fs which is supported by both, windows
and linux).

lg Clemens
