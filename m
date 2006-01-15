From: Michael Barnwell <xterminate@xterminate.me.uk>
Subject: Re: Data being corrupted on reiserfs 3.6
Date: Sun, 15 Jan 2006 23:02:20 +0000
Message-ID: <43CAD47C.3090503@xterminate.me.uk>
References: <43C97E17.7030604@xterminate.me.uk><20060115204143.GC24752@atrey.karlin.mff.cuni.cz><43CAC054.5020104@xterminate.me.uk> <20060115232926.34062338.petchema@concept-micro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-27733-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060115232926.34062338.petchema@concept-micro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: reiserfs-list@namesys.com

Thanks,

Pierre Etchemaïté wrote:
> Le Sun, 15 Jan 2006 21:36:20 +0000, Michael Barnwell <xterminate@xterminate.me.uk> a écrit :
> 
>> I'm not sure how to search 
>> through a binary file for non-zero bytes.
> 
> cmp -b ?

michael@biggs:~$ cmp -b /tmp/1GB.tst /home/michael/1GB.tst
/tmp/1GB.tst /home/michael/1GB.tst differ: byte 68494094, line 1 is   0 
^@  40

That seems to stop after the first difference, so I did: -

michael@biggs:~$ cmp -bl /tmp/1GB.tst /home/michael/1GB.tst | wc -l
243

The full output of cmp -bl is at http://pastebin.com/507389

Regards,

Michael.
