From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 0/2] reiser4: patches for Linux-3.14
Date: Mon, 05 May 2014 18:13:35 +0200
Message-ID: <5367B8AF.302@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=RKKIDxpBILNk4wQXulrqtYBsaBMMpV4d6U/rn8G8hD8=;
        b=L7Gqa1TfBEANXOnIr/T+miMS8++U4JUsh+x+GC0IEpWakOV3JyOqvUsPZiDaEZa0Kh
         PqmwcxkEHTcwK5xW8qcinrBAp5ubS19EWxSOfY/NsgvECNSoBpKWSSKNQrKaQplXcb7i
         2iZ0tL+vHeYWUf3ZHKbq9qsfOnJ3MgIRIlJ/PzCqzNfvru79Oi3wMYjwe/eHMzHLdoRn
         Q4i4SfWEKSYtsHkrotFamSsDVeBL2WYaFLrgRZdiw6A6xHKE5D8ugdipWgJ7fyulYw/n
         ApVEutC3SoNV8LM4e8BYwRf7yuuLRSR7gCSQiRlt7aczVPrNWm0i2qs0VjvlRD0KMO7x
         Z8CA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

Mathieu Belanger:
. Port for Linux-3.14

Edward Shishkin:
. Add different transaction models
