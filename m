From: Hans Reiser <reiser@namesys.com>
Subject: Re: Filesystem Tests
Date: Thu, 07 Aug 2003 17:51:50 +0400
Message-ID: <3F325976.5090301@namesys.com>
References: <3F306858.1040202@mrs.umn.edu>	<20030805224152.528f2244.akpm@osdl.org>	<3F310B6D.6010608@namesys.com>	<20030806183410.49edfa89.diegocg@teleline.es>	<20030806180427.GC21290@matchmail.com>	<20030806204514.00c783d8.diegocg@teleline.es>	<20030806190850.GF21290@matchmail.com> <20030806214023.74546b84.diegocg@teleline.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15232-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030806214023.74546b84.diegocg@teleline.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Diego_Calleja_Garc=EDa?= <diegocg@teleline.es>
Cc: Mike Fedyk <mfedyk@matchmail.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Diego Calleja Garc=EDa wrote:

>El Wed, 6 Aug 2003 12:08:50 -0700 Mike Fedyk <mfedyk@matchmail.com> escrib=
i=F3:
>
> =20
>
>>But with servers, the larger your filesystem, the longer it will take to
>>fsck.  And that is bad for uptime.  Period.
>>   =20
>>
>
>Sure. But Han's "don't benchmark ext2 because it's not an option" isn't
>a valid stament, at least to me.
>
>I'm not saying ext2 is the best fs on earth, but i *really* think
>it's a real option, and as such, it must be benchmarked.
>
>
> =20
>
Actually, I think it would be nice if Grant benchmarked it because it=20
shows the overhead of ext3's journaling, but it should be noted that it=20
is not a valid option for most servers.

--=20
Hans


