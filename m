From: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Subject: Re: hashes in reiser3.6
Date: Sun, 21 Nov 2004 00:00:35 +0100
Message-ID: <2f4958ff04112015003b0bca9e@mail.gmail.com>
References: <2f4958ff041118114530134bff@mail.gmail.com>
	 <419D031D.9050807@novell.com>
Reply-To: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22450-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <419D031D.9050807@novell.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

On Thu, 18 Nov 2004 15:16:29 -0500, Jeff Mahoney <jeffm@novell.com> wrote:

> If the filesystem is already established, you can't switch hashes. The
> hash is global to the filesystem, so if you were to change it, lookups
> would fail and you wouldn't be able to find any of your files.
>
> If you're creating a new filesystem, you can use the --hash argument to
> mkreiserfs. Under most circumstances, the filesystem code will
> automatically discover which hash you're using at mount time.

Thanks, but the trick is that I would like to switch over existing
partition to other hash.
I know, I can copy over all data on side, and recreate partition from
scratch, but it's just way too painfull. It should be possible to do
this in much easier way.
So you say, that reiserfs doesn't store filenames in strucures, but
uses just hashes to lookup ? Shouldn't it be possible to go through
all structures on the partition, and recreate hashes, but using
different key function ?
I am prepared to spend some time,and do this.

-- 
GJ
