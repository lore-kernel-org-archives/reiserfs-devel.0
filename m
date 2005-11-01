From: Edward Shishkin <edward@namesys.com>
Subject: Re: zlib support...
Date: Tue, 01 Nov 2005 19:47:07 +0300
Message-ID: <43679C0B.1040302@namesys.com>
References: <1ddd44e40510301421k127e316eo4f46b4277fc80858@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26758-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1ddd44e40510301421k127e316eo4f46b4277fc80858@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ninja@slaphack.com
Cc: reiserfs-list@namesys.com

David Masover wrote:

> Compiling a 2.6.12.5 <http://2.6.12.5> kernel on my Powerbook, I 
> discovered something odd.


hmm.. this is an old bug.
I put the fix for 2.6.12 here:
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12/zlib_fix_dependence.patch

Thanks,
Edward.

>   Reiser4 (vanilla patch) was insisting on being a module.
>
> Alright, why does it still depend on CONFIG_ZLIB_INFLATE and 
> CONFIG_ZLIB_DEFLATE, even when the cryptocompress plugin isn't being 
> used at all, and is in fact nonfunctional?
>
> Anyway, I can live with a little RAM bloat, but for some reason, I 
> couldn't find the options to enable any zlib in the kernel.  I could 
> enable INFLATE support by forcing something I know uses it to be 
> compiled in -- compressed isofs support.  But I couldn't find 
> something sane to force DEFLATE on.  DEFLATE defaults to being a 
> module, and INFLATE seems to follow whatever I set isofs support to be 
> -- if I want INFLATE compiled in, to compile Reiser4 in, I have to 
> compile isofs in.
>
> Still workable, but very, very stupid, especially considering zlib is 
> never actually used, only compiled against and depended on.
>
> Ok, first actual bug:
> I could try to compile Reiser4 in at this point, but the final link 
> fails, because it does need deflate support, even though it doesn't 
> depend on CONFIG_ZLIB_DEFLATE.
> Solution:  Either remove cryptocompress until it works, or depend on 
> CONFIG_ZLIB_DEFLATE.
>
> Now, second actual bug, not actually your fault:
> Neither DEFLATE nor INFLATE can be configured manually, yet you depend 
> on one (or both) of them, without actually setting them.  Thus, if 
> CONFIG_ZLIB_DEFLATE is compiled as a module, Reiser4 must be a module, 
> and there's no way to change that from inside menuconfig.  Editing the 
> .config file manually doesn't work.
> Solution:  Make it possible to select INFLATE and DEFLATE support 
> manually, just like CRC32 and other library functions, or have Reiser4 
> enable them when it needs them, instead of insisting on being a module.
>
> The real surprise is, this problem only started happening on my PPC 
> system.  I'm not sure if it's a config script glitch, an 
> architecture-specific problem, or something else entirely.  But then, 
> my PPC is the only 2.6.12 system I currently run that tries to compile 
> in Reiser4 support -- the desktop loads it from a ramdisk, because it 
> needs the ramdisk anyway, and the other amd64 box is running 2.6.13.  
> Maybe configure is supposed to work this way, but the dependencies are 
> wrong.
>
>
>
> I realize this is all probably old news, but I'm sending it anyway, 
> because maybe it's not.  I'm sending it from a gmail address because I 
> don't have networking on said Powerbook yet.


