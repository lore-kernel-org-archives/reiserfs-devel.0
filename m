From: Jindrich Makovicka <makovick@kmlinux.fjfi.cvut.cz>
Subject: Re: reiser4progs 1.0.4
Date: Sat, 19 Mar 2005 19:03:19 +0100
Message-ID: <423C6967.6090604@kmlinux.fjfi.cvut.cz>
References: <200502201344.41656.vitaly@namesys.com> <200502211949.43255.vitaly@namesys.com> <423B250A.60209@kmlinux.fjfi.cvut.cz> <200503191723.49457.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200503191723.49457.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Vitaly Fertman wrote:
> On Friday 18 March 2005 21:59, Jindrich Makovicka wrote:
> 
>>Vitaly Fertman wrote:
>>
>>>>so 1.0.3 & 1.0.4 bail out. Using fsck.reiser4 --build-sb from
>>>>reiser4progs 1.0.3 rendered the filesystem created under 1.0.0 unusable,
>>>
>>>
>>>fsck.reiser4 --build-sb is supposed to fix evth. what goes wrong?
>>
>>sorry I didn't replied earlier, but I didn't have a spare disk
>>available. here it goes. 40GB partition was mkfs'ed with 1.0.0,
>>populated somehow (about 32k files, 400MB), then fsck --build-sb from
>>1.0.4 was run:

I think I didn't run mkfs 1.0.4. I once tried debugfs.reiser4 -C on the 
test partition before fsck, as I had run it on one of my live partitions 
previously, because I originally thought it does the migration (the 
partition seems to have survived). Can this be the cause too? Is it 
still possible to migrate such partition to 1.0.4 or I should do full 
backup & dd if=/dev/zero /dev/hdXX & mkfs & restore?

-- 
Jindrich Makovicka
