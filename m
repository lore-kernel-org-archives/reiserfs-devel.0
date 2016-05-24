From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: How can checksums (node41) be of real help?
Date: Tue, 24 May 2016 12:01:50 +0200
Message-ID: <c7519dd1-871e-9dab-9bac-2d8aa1ee1951@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=qwKnEqxVpRHnyDB7nF/gzllxPb4AFuTAU3S/3L+son0=;
        b=ZWQ1N03jwMmzmkRv6H5fCe8phSsaRr4heu6lwjDR4mb2sTMUi2+hccU5cR3jyBc0Kh
         Kv+YJNZ10hF0mcG+6Z4oYeoD63JCr27cK0A+6ZKpV8ylB++2EwnlrFpimoxc8M52te7H
         v+z27Z6LlFKgpI9tFGfL7FRl5ShytSDNHFZ+iX+3Lad18xsxFDz9TaQxLtSYc8viUSXL
         mIMleuLtoI1PGlhsuq8cx+q1Q9u3XzpmeKAi20x5+tNkG1KRz8z0l/BuWVNJkQSWOpuA
         2qcH4k3aaWz8TlJh+2Rb5SnlMx8fgfEib//XplRk6fkvC7b0LGV283hs7a0uYbiTzt9C
         Z7ZA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

On 05/24/2016 10:50 AM, Georgios Tsalikis wrote:

 > I suppose they are great for discovering corrupted files, but is 
there any way we can use them to retrieve a good copy of corrupted files?

Hello,

Currently if checksum verification failed, then the file system becomes 
readonly
with the suggestion (in kernel messages) to repair the partition with fsck.

Ofc, it is not convenient, but better than nothing. More efficient way 
is to support replicas, so
that every time when checksum verification failed, you upload respective 
replica. It is not difficult
to implement. Just allocate/release replicas simultaneously with 
conventional formatted blocks.
Pointers to replicas can be placed near the checksums (a new node42 
format is needed).
The patches 3.18.6-reiser4-add-node41-support.patch and 
reiser4progs-1.0.9-add-node41-support.patch
are a good example of how to add a new node format.

Thanks,
Edward.


