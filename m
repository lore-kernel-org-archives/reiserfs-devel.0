From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiser4 snapshot 20030905 [OOPS]
Date: Mon, 15 Sep 2003 17:52:55 +0400
Message-ID: <16229.50231.715275.197988@laputa.namesys.com>
References: <20030826102233.GA14647@namesys.com>
	<Pine.LNX.4.51.0309151249310.1934@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15671-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.51.0309151249310.1934@dns.toxicfilms.tv>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Maciej Soltysiak writes:
 > Hi,
 > 
 > I compiled the kernel (2.6.0-test5) without key_large support
 > I attached a disk /dev/hda (I'm booting off /dev/hdb)
 > 
 > # mkfs.reiser4 /dev/hda1
 > Went ok
 > 
 > # mount -t reiser4 /dev/hda1 /1
 > And here's the output. It seems unsupported keys cause null pointer
 > dereference.

This is known problem. Actually, reiser4 mount function cannot handle
errors very well at the moment.

 > 
 > reiser4[mount(1504)]: get_ready_format40 (fs/reiser4/plugin/disk_format/disk_format40.c:229)[nikita-3228]:
 > WARNING: Key format mismatch. Only small keys are supported.
 > Unable to handle kernel NULL pointer dereference at virtual address 00000000
 >  printing eip:

[...]

 >  [<c0109089>] sysenter_past_esp+0x52/0x71
 > 

Nikita.
