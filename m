From: "Yury V. Umanets" <umka@namesys.com>
Subject: Re: libaal compile fails
Date: Mon, 10 Nov 2003 11:51:19 +0300
Message-ID: <1068454279.1743.18.camel@firefly>
References: <3F9F80F0.5040206@namesys.com> <3F9F811D.7070902@namesys.com>
	 <3FAE01DF.7090802@tupshin.com>  <3FAE0CDF.9080104@tupshin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16030-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FAE0CDF.9080104@tupshin.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tupshin Harper <tupshin@tupshin.com>
Cc: ReiserFS <reiserfs-list@namesys.com>, S?valdur Gunnarsson <addi@root.is>

On Sun, 2003-11-09 at 12:46, Tupshin Harper wrote:
> Tupshin Harper wrote:
> 
> > Yury Umanets wrote:
> >
> >> Yury Umanets wrote:
> >>
> >>> >>When I try building libaal it fails with the following error message:
> >>>
> >> Forgot to ask. Do you use recent snapshot of libaal?
> >>
> > FWIW, I get the exact same problem as Saevaldur. Using 
> > libaal-0.4.13.tar.gz, and attempting to compile on a Debian Sid x86 
> > machine. I can only imagine it's a gcc parsing bug (line 213 indeed 
> > does not have a square bracket). GCC is 3.3.2. Commenting out the 
> > check performed by that line results in a sucesful compilation.
> >
> > -Tupshin
> >
> A bit more info.
> 
> It is not a problem with the gcc version, as the same message comes from 
> 3.2 and 2.95.
> 
> I'm guessing that it emerges from macros expanded through multiple 
> layers of expansion.
> BLKGETSIZE64 expands to _
> IOR(0x12, 114, sizeof(uint64_t))
> 
> _IOR expands to
> _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(size)))
> 
> and _IOC_TYPECHECK expands to
> ((sizeof(t) == sizeof(t[1]) && sizeof(t) < (1 << _IOC_SIZEBITS)) ? 
> sizeof(t) : __invalid_size_argument_for_IOC)
> 
> which is the first hint of a bracket on that line. That's as far as I'm 
> going ;-).
> 
> -Tupshin
Hello,

First of all thanks for shutting a bug. There is really one error in the
macro you have pointed to. 

Old variant is:

#if defined(__linux__) && defined(_IOR) && !defined(BLKGETSIZE64)
#   define BLKGETSIZE64 _IOR(0x12, 114, sizeof(uint64_t))
#endif

New variant (right one) is:

#if defined(__linux__) && defined(_IOR) && !defined(BLKGETSIZE64)
#   define BLKGETSIZE64 _IOR(0x12, 114, uint64_t)
#endif

But I don't think, that problem is related to it. Also, we have not such
a error on gcc 3.3.1 and older. Can you try to build libaal with this
fix and see what happens?


Thanks.
-- 
umka

