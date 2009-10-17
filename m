From: Viji V Nair <viji@fedoraproject.org>
Subject: reiserfs - recommendations for small files
Date: Sat, 17 Oct 2009 23:41:12 +0530
Message-ID: <84c89ac10910171111n69b9832fr42d30aa07d84b262@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=tfD5PD6/+LCc0NPjUoZYfPVXpOxd3rGOnhKnPZig6Qo=;
        b=wkDeg9FYr4SPOABDhKJCGMZZVn+wEnjmfVjuJ42eYdyLjG1ufcyhm2j4ts7e/0NQ1V
         4A3V+W+MOIcMvxvVB9yWYTHA2Qdk3c2eRx4Lagv7roCig6iNfGjzIbqF+/Jbh88E8drS
         CrYZeKQ4avcQ6lZL4V08KuD2goj67ewk2TDGA=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hi,

System : Fedora 11 x86_64
Current Filesystem: 150G ext4 (formatted with "-T small" option)
Number of files: 50 Million, 1 to 30K png images

We are generating these files using a python programme and getting
very slow IO performance. While generation there are only writes, no
read. After generation there are heavy read and no write. These files
are not in a single directory, this is a pyramid structure. There are
total 15 pyramids and coming down from top to bottom the sub
directories and files  are multiplied by a factor of 4

I am looking for an alternate file system and best
practices/recommendation to get a better performance. What the
optimisation methods available in reiserfs for small files?

Any suggestions of the above are greatly appreciated.

Viji
