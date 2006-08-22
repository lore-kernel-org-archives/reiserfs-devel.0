From: David Masover <ninja@slaphack.com>
Subject: Re: problem with reiser3
Date: Mon, 21 Aug 2006 20:23:30 -0500
Message-ID: <44EA5C92.4010801@slaphack.com>
References: <20060821222421.GC14067@grulic.org.ar> <44EA4400.6090501@namesys.com> <20060821235338.GE14067@grulic.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29650-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060821235338.GE14067@grulic.org.ar>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcos Dione <mdione@grulic.org.ar>
Cc: Edward Shishkin <edward@namesys.com>, reiserfs-list@namesys.com

Marcos Dione wrote:

>> it would be better to create a backup on a spare bigger partition
>> using dd_rescue (pad not recoverable zones with zeroes), then run
>> fsck on the created image.
> 
>     unluckly I can't. it's a 160 GiB partition and I don't have spare
> space.

How much spare space do you have?  You may be able to do some tricks 
with dm_snapshot...
