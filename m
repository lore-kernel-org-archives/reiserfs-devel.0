From: Anders Widman <andewid@tnonline.net>
Subject: Re[2]: Fsck over Telnet is slow.
Date: Fri, 31 May 2002 17:31:27 +0200
Message-ID: <10129443937.20020531173127@tnonline.net>
References: <1073646515.20020531102130@tnonline.net>
 <wv66147i4l.fsf@freeze.oslo.dnmi.no> <1022847700.22886.1683.camel@tiny>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10468-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1022847700.22886.1683.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: Adrian Phillips <a.phillips@dnmi.no>, reiserfs-list@namesys.com

Great! I'll try it :)

//Anders


> On Fri, 2002-05-31 at 05:59, Adrian Phillips wrote:
>> >>>>> "Anders" == Anders Widman <andewid@tnonline.net> writes:
>> 
>>     Anders>    Is it just me, but I think reiserfsck is slow over
>>     Anders> telnet, or even slower over ssh. It seems as it would be
>>     Anders> better to not print the progress as fast, if the
>>     Anders> connection to the terminal is slow.
>> 
>>     Anders>    Of course, I could use a log file instead.
>> 
>> Try with -q (I think) instead,

> Yes, that works pretty well.  I use it over a serial console without
> problems.

> -chris

