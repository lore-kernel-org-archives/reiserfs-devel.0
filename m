From: Oleg Drokin <green@namesys.com>
Subject: Re: kernel loop with lseek + LFS on reiser partition -- attachment pasted.
Date: Mon, 22 Apr 2002 13:12:04 +0400
Message-ID: <20020422131204.A8916@namesys.com>
References: <OF06243103.539AEE43-ONC1256BA3.0030EF24@ev-i.at>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10110-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OF06243103.539AEE43-ONC1256BA3.0030EF24@ev-i.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wolfgang.glas@ev-i.at
Cc: reiserfs-list@namesys.com

Hello!

   Well, I see the problem. Going to investigate...

Bye,
    Oleg
On Mon, Apr 22, 2002 at 10:57:45AM +0200, wolfgang.glas@ev-i.at wrote:
> Hi all,
> 
> OK, My e-mail Program refuses to attach this file, so cut'n'paste seems 
> just fine.
> (I'm using lotus Notesunder wine, :-( )
> 
> -----------------BOF: seek.c----------------------------------------
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <fcntl.h>
> #include <syslog.h>
> #include <unistd.h>
> 
> /* compile under linux-2.4 using:
> 
> gcc -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE seek.c
> 
> */
> 
> /* This is my personal strategy to keep the boredom from plain C code...) 
> */
> #define STRINGIFYIFY(i) #i
> #define STRINGIFY(i) STRINGIFYIFY(i)
> 
> #define CHECK_C_ERROR(call) if((call)==-1) { \
> syslog(LOG_ERR, \
>    __FILE__ "(" STRINGIFY(__LINE__) "): " #call " failed: %m"); \
> exit(2); \
> }
> 
> #define CHECK_C_ERROR64(call) if((call)==(off_t)-1) { \
> syslog(LOG_ERR, \
>    __FILE__ "(" STRINGIFY(__LINE__) "): " #call " failed: %m"); \
> exit(2); \
> }
> 
> int main()
> {
>   int fd;
>   off_t pos=128*1024*1024*(off_t)1024; // 128 GB
> 
>   syslog(LOG_WARNING,
>          __FILE__ "(" STRINGIFY(__LINE__) "): sizeof(off_t)=%d",
>          sizeof(off_t));
> 
>   CHECK_C_ERROR(close(0));
>   CHECK_C_ERROR(close(1));
>   CHECK_C_ERROR(close(2));
> 
>   CHECK_C_ERROR(fd=open("seek.tmp",O_CREAT|O_TRUNC|O_WRONLY,0644));
> 
>   syslog(LOG_WARNING, \
>          __FILE__ "(" STRINGIFY(__LINE__) "): fd=%d, pos=%.0lf",
>          fd,(double)pos);
> 
>   CHECK_C_ERROR64(lseek(fd,pos,SEEK_SET));
> 
>   CHECK_C_ERROR(write(fd,"Hello, world!",13));
> 
>   CHECK_C_ERROR(close(fd));
> }
> ----------------------EOF-------------------------------------------------------
> 
>     Wolfgang
> 
> --
> Dr. Wolfgang Glas                        EV-i Informationstechnologie 
> GmbH.
> Gesch?ftsf?hrer                          Sebastian-Kneipp-Weg 17
> Wolfgang.Glas@ev-i.at                    A-6020 Innsbruck/Austria
> phone: ++43-512-284883-2                 fax: ++43-512-281624-31
> 
