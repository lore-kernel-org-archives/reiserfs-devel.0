From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: Compile error 2.6.9
Date: Tue, 02 Nov 2004 13:35:45 +0300
Message-ID: <41876301.6030504@namesys.com>
References: <NDBBKABJBJCIJNAELLKEEEEJJEAA.jimm@simutronics.com> <4186D662.7080407@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000006010208030802000402"
Return-path: <reiserfs-list-return-22252-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4186D662.7080407@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: jimm@simutronics.com
Cc: reiserfs-list@namesys.com

--------------000006010208030802000402
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

E.Gryaznova wrote:

> Jim Miller wrote:
>
>> I got the follow errors while compiling 2.6.9 linux kernel. I followed
>> these dirs:
>> 1. get 2.6.9 (ftp.kernel.org:/pub/linux/kernel/v2.6/linux-2.6.9.tar.gz)
>> tar zxf linux-2.6.9.tar.gz -C /usr/src
>> 2. get reiser4 core patches:
>> ftp.namesys.com:/pub/reiser4-for-2.6.9/2.6.9.diff
>> cd /usr/src/linux-2.6.9
>> cat 2.6.9.diff | patch -p1
>> 3. add reiser4 to linux-2.6.9
>> ftp.namesys.com:/pub/reiser4-for-2.6.9/reiser4.tar.bz2
>> cd /usr/src/linux-2.6.9/fs
>> tar jxf reiser4.tar.bz2
>> 4. patch reiser4 to match 2.6.9
>> ftp.namesys.com:/pub/reiser4-for-2.6.9/reiser4-for-2.6.9.diff
>> cd /usr/src/linux-2.6.9
>> cat reiser4-for-2.6.9.diff | patch -p1
>>
>> All of the patches applied successfully. Any suggestions would be
>> appreciated.
>>
>> CC fs/reiser4/plugin/cryptcompress.o
>> fs/reiser4/plugin/cryptcompress.c: In function `inflate_cluster':
>> fs/reiser4/plugin/cryptcompress.c:1018: parse error before `*'
>> fs/reiser4/plugin/cryptcompress.c:1019: `cplug' undeclared (first use in
>> this function)
>> fs/reiser4/plugin/cryptcompress.c:1019: (Each undeclared identifier is
>> reported only once
>> fs/reiser4/plugin/cryptcompress.c:1019: for each function it appears 
>> in.)
>> make[3]: *** [fs/reiser4/plugin/cryptcompress.o] Error 1
>> make[2]: *** [fs/reiser4] Error 2
>> make[1]: *** [fs] Error 2
>> make[1]: Leaving directory `/usr/src/linux-2.6.9'
>> make: *** [stamp-build] Error 2
>>
>>
>>
>>
>> Thanks,
>> Jim
>>
> Hello,
> would you please send me your config file?
>
> Thanks,
> Lena 

Would you please try this patch?

Thanks,
Lena.


--------------000006010208030802000402
Content-Type: text/plain;
 name="cryptcompress.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cryptcompress.c.diff"

===== plugin/cryptcompress.c 1.133 vs edited =====
--- 1.133/plugin/cryptcompress.c	2004-10-27 19:55:54 +04:00
+++ edited/plugin/cryptcompress.c	2004-11-02 12:12:18 +03:00
@@ -1013,9 +1013,10 @@
 	assert("edward-907", !tfm_cluster_is_uptodate(tc));
 	
 	if (inode_get_crypto(inode) != NULL) {
+		crypto_plugin * cplug;
+
 		/* FIXME-EDWARD: isn't support yet */
 		assert("edward-908", 0);
-		crypto_plugin * cplug;
 		cplug = inode_crypto_plugin(inode);
 		assert("edward-617", cplug != NULL);
 		

--------------000006010208030802000402--

