From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: A best approach to get a summary of r4-conflicting kernel changes from 2.6.39
Date: Sat, 18 Aug 2012 00:53:35 +0400
Message-ID: <5669697.fA5P36S773@intelfx-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:user-agent:mime-version
         :content-transfer-encoding:content-type;
        bh=26WsZJCQYDntfS98hl/wSW0MgP/kpVpEhg+/Y6FG2No=;
        b=VxdOwgGvaWvi6Hqvij0N6YprTZtWu8ydz7LGsG6AiinswSEOEMR+D93gmeKVLphmya
         xjoitHKqQNTGzD+jKFkEEtG5kUJiAa/Td1zcoRyxv0ZiOUMgjaJA6msUQVXtMapl4Wrb
         NUBSmhTag7+Jsu2pxx8O7ntHrBz2T1hmz9KalBSpyOIDZ49/eMgYcqpkfA3grhl5kDxc
         rmafvvKgOVgQm7Ej6viOnybKsVuNtr9WjRMYprup7wB2SwH7nTyPv45UHvyqPdQgCOhI
         aRoHBSLQSpxo/2HtTF5MAgDD4lLVex3IMpYv2LFV17n8b3I2kZT1AcN5WGvkVYfcf8NP
         4y3g==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

Hello,

What is the best way to get some "summary" of changes that the kernel had 
undergone from 2.6.39 (last reiser4-compatible) to current? I need not all 
changes, but only those which make the current kernel reiser4-incompatible.
In particular, will "git log" suffice - and if yes, to which files/directories 
shall it be applied?

Thanks in advance,
Ivan Shapovalov
