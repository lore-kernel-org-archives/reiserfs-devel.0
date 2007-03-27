From: Ignatich <ignatich@gmail.com>
Subject: [Fwd: reiser4 bugs in 2.6.21-rc4]
Date: Tue, 27 Mar 2007 23:47:58 +0400
Message-ID: <460974EE.8080006@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010905040308000206060201"
Return-path: <reiserfs-list-return-30620-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:content-type;
        b=BjrcKavr3kE8IgsiXmemFum5CZ70/c/e0KeQ1GzG54M1ehIhF1mNtAKnO3+XxdrjAxHwlLu8sEZolhj05feg408qMIL4HAkl+s/MDdYc8J/smvAgMAwxfgHegUFJ6hbiH8pWYIkyieG/KT00kfjx6bnT7KMMlNXdYiqq43XjrY4=
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------010905040308000206060201
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit



--------------010905040308000206060201
Content-Type: message/rfc822;
 name="reiser4 bugs in 2.6.21-rc4"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4 bugs in 2.6.21-rc4"

Message-ID: <4609708E.5090908@gmail.com>
Date: Tue, 27 Mar 2007 23:29:18 +0400
From: Ignatich <ignatich@gmail.com>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: linux-kernel@vger.kernel.org
Subject: reiser4 bugs in 2.6.21-rc4
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit

There are two bugs I found in current -mm reiser4 code.

1. Some files seem to be zeroed out randomly. Usually it's 
/lib/security/pam_limits.so and /lib/security/pam_deny.so. As 
fsck.reiser4 didn't find anything wrong I decided to create clean 
installation in vmware and see if this bug appears on newly formatted 
partition. It did.

2. Sometimes I get oppses in reiser4_do_readpage_extent. Assert codes 
are vs-1426 and nikita-2688. A patch was posted on namesys list to 
address this problem, but it didn't help.

Kernel: 2.6.21-rc4 with manually applied reiser4 patches from -mm. Arch: 
x86-64


--------------010905040308000206060201--
