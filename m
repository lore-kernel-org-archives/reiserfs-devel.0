From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-3.16
Date: Sun, 12 Oct 2014 15:54:57 +0200
Message-ID: <543A8831.3010103@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=sRXbQ1X2WmOf+DqKV0m9hNyw6tedYtTvUI1ozDmfT7M=;
        b=tki1L/eQJfZ/ZYQm0+q2JOCEtCFRFcDMk/TkFw8ZIg+ecQKhJ+hAm+KNbDJhjQykwO
         9eyQhtrZFdm5qq155fWyXuIf8emwW/Po/VlvpWk2rHKmWAHawJ7osK50sW6/5PKfMEUA
         RbfSXvnnDn1nd6Z3TX1XX6uY0lyk3CnaW6S/YsOj3MOzXjThzjM7T6Ik29bU7Lq2pCNz
         y1j4H/d6NLiU2VRFBNQ/p5lUgowVqgd12FofcrKnhk6dpG00I9Fguv6ojsIAv3WgenJr
         xPaCkCpn0dq4W5HT/hmJ5UhHDjGQ/1AdhR5w7ygvDXSuMaLXOl8HKbilAmkqADvtQTLu
         Li+w==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Changes since reiser4-for-3.15.2:

Edward Shishkin:
. Fix the ancient problem of non-deletable directories

Ivan Shapovalov:
. Add basic discard support for SSD devices

Please, find at
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/

Thanks,
Edward.
