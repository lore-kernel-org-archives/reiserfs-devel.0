From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS slow, need help diagnosing
Date: Mon, 05 Jun 2006 09:22:41 -0700
Message-ID: <44845A51.9030504@namesys.com>
References: <e61aht$7kf$1@sea.gmane.org>  <1149516737.6402.120.camel@tribesman.namesys.com>  <e61f4n$p6b$1@sea.gmane.org>  <1149520582.6402.134.camel@tribesman.namesys.com>  <Pine.LNX.4.63.0606051732110.25988@alpha.polcom.net> <1149522884.6402.144.camel@tribesman.namesys.com> <Pine.LNX.4.63.0606051805300.25988@alpha.polcom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28735-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.63.0606051805300.25988@alpha.polcom.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grzegorz Kulewski <kangur@polcom.net>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, Juergen Starek <quiterigorouslyfilteredusenetaccount@gmx.de>, reiserfs-list@namesys.com

Grzegorz Kulewski wrote:

>
>>
>> Well, inode location in reiser4 changed comparing to reiserfs. reiser4
>> groups inodes of files of one directory together (reiserfs did not do
>> that), but still allocated disk space for inodes dynamically as
>> reiserfs.
>> So, I guess that reiser4 will be better than reiserfs, but
>> still worse than ext[23]. Would you verify this guess it please?
>
I wouild not assume this.  There is a huge difference with respect to
this usage pattern between reiser4 and reiser3, it should dramatically
improve.  I don't know if we will be better or worse than ext3, it could
be either, best to measure it.
