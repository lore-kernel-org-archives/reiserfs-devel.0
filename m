From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: fsck 0.5.5 time
Date: Fri, 18 Jun 2004 15:29:01 +0300
Message-ID: <20040618122901.GI4990@nysv.org>
References: <20040618110112.GG4990@nysv.org> <40D2D82B.3090301@namesys.com> <200406181620.25609.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19252-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406181620.25609.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

On Fri, Jun 18, 2004 at 04:20:25PM +0400, Vitaly Fertman wrote:
>> > How long is the expected time for fsck to run?
>depends on the speed of your hardware, kind of corruptions, 
>fsck options, many things.

Yeah, I was just hoping for some rough estimate of a clean filesystem
with a some benchmark setup :)

Well, it's not that critical.

>> > Are there any risks in using the /home/ read-write without the stat data
>> > extensions, or whatever --fix fixes?
>should be ok, if you are talking about the plugin set that is added into 
>the root. 

Well, I guess I am :)
I couldn't remember exactly what the new addition that wanted --fix was,
but I thought I remembered it was statdata extensions.

>yes, you are right, there will be some progress on semtanic pass also, 
>it has not been implemented yet. 

Hooray! I owe you a beer :)

-- 
mjt

