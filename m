From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 0/3] reiser4: metadata checksums
Date: Sun, 16 Aug 2015 15:22:15 +0200
Message-ID: <55D08E87.8060509@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=+q50IylwFOHsgS9F1PN8HmPE985XhBhC8ZzJHaYTqVY=;
        b=FqIlNvyTUGbdRxN6Q64v3/ZAh6kWoWYhTwrLlv7+PtYBxqQC4RUckAXonQp9OkBY36
         wFFPJ32gIHE3plDV9h8iF/k3B5LvsQK/W5xYLhGsMT7PmhScf1ZW2TiHBVMTNWQeS1/n
         K8bxqn5GX6Q9fauSkWgSdX25wq0msxmu+t92tnQvPzsdnSq3GccTId+54vGWzR3mjNnV
         0Q4Bf0R6PyNT6qfmBFFmylRIXLoSmmRupKfb5xSu2o3+gjnY9661kg3omB/A1Cg+hmCl
         9YyDjcsnctmd3HFq/eb4T+bMCzFiwh8upVysXkcq0CYen54koZDQ1L0JL5967+OZYQzT
         X3Mg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This patch series is against patch 3.18.6-reiser4-add-node41-support.patch
Find at: http://sourceforge.net/projects/reiser4/files/patches/
Can be easily forward ported to more fresh stuff.

NOTE: Mount will upgrade disk format version of your partition.
WARNING: For testing only!!!
