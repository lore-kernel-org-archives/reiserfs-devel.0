From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: On plugins, on-disk formatting and such
Date: Mon, 12 Apr 2004 18:33:44 +0300
Message-ID: <20040412153344.GG14134@nysv.org>
References: <20040410100701.GE5229@nysv.org> <407AB278.8030209@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17869-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <407AB278.8030209@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, Nikita Danilov <god@namesys.com>, vitaly@thebsh.namesys.com, vs <vs@thebsh.namesys.com>

On Mon, Apr 12, 2004 at 08:15:04AM -0700, Hans Reiser wrote:

>oh excellent, I think we just have to fix a problem with crashing when 
>mmap consumes all of memory, and we are ready to ship

This is not something that other kernel people should look into?

>I don't understand your question.  We don't use xattrs and I think they 
>should never have been put into the kernel.  We will not burden our code 
>with support for them.

This I understood, and I may be a bit lost myself here.
I meant that if a program does a xattr call on Reiser4 it gets
transparently mapped to the Reiser4 api. I dunno, and really, I
don't even care that much. As long as it works and gets into the mainline
kernel.

[on.disk.layout.]
>Because plugins make it easy and painless for users, you can expect it 
>to change all the time.  If you mean change without grace, we try to 
>avoid that.  Unfortunately curing a recent discovery that we cannot do 
>it gracefully (in regards to inheritance) required a non-graceful change 
>to cure it, sorry about that.  I still need to review that code to make 
>sure all issues regarding inheritance and defaults are fully graceful.

What I was basically after was the real bottom-line end-user perspective.

Every chance of having to do an mkfs is a turnoff. Naturally plugins
may change the layout, but that's the point of grace :)

>>4) http://thebsh.namesys.com/snapshots/2004.03.26/READ.ME
>>  4.1) I have used Reiser4 as my rootfs for a long, long time.
>Thanks, Vitaly fix that.

Is the problem supposed to be about remounting?
I tried -o remount,ro and ,rw on my home partition, it worked, but
after doing a SysRq remount mount still said it was rw.

This freakishness may be separate from being able to use it as
the root fs.

[loadable.fs.plugins]
>It is because I want either code or money from those who  build on top 
>of reiser4.  Allowing people to escape the GPL for free is not to my 
>advantage.  Also, I don't want to find out whether it affects performance.

This is certainly a valid point.
Isn't it still possible that someone writes an fs plugin and never releases
it, though?

Maybe it's possible that it would affect performance... Although I have
no data or experience from benchmarks with average kernel modules.

>>  One of the good things for me in Linux is that I can use honest
>>  modules to try something, rmmod, recompile, insmod and I don't
>>  think this is any different.
>Hmmm, when your NVIDIA drivers lag a few releases and you don't have the 
>source, fun, yes?

I'm afraid I don't follow :)
The fear here is that I download a third-party plugin, use it, update
my kernel and get breakage because the third-party hasn't updated yet?

This is always a risk when using third-party modules, be they GPL or not.
But proprietary, closed-source, (thus infringing?), Reiser4 plugins are
imo a lot less likely.

>This performance advantage is due to allocate on flush allowing us to 
>write in huge extents at flush time even though files get written to in 
>slow trickles.  This improves b

NO CARRIER+++

Thanks a million for the answers!

-- 
mjt

