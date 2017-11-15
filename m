From: jose@huitzilopochtli.metztli-it.com (Metztli Information Technology)
Subject: Success in booting a 2TB \'maximum boot disk\' reiser4 image natively in Google Compute Engine \(GCE\)
Date: Wed, 15 Nov 2017 04:44:40 -0800 (PST)
Message-ID: <20171115124440.2B8BAEC11CA@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1510749935; h=From: Date: Message-Id: To: Subject: Sender;
 bh=ElkcPoDy53fYbQf8GjyaZkIeqQgJDNtm5ovLrWX13zU=; b=uBiC/8/KTWHa2SdWl/wR9Fa3ZsnwdJZuCN2kWXYR70Alq/BuZcIWbmJWfWwWidxNgLM9JvCO
 iIL7e0joAKf82a9EcZNhFlm7KQPD93ZhRsAT2R77t8jpBbOXrrVqAkVqxZ/vKrKfF/B7umNS
 kzDsaS15/FOjIW/s5uaMghoJl9A=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Niltze, all-


Yesterday I succeeded in booting a 2TB maximum 'boot disk' reiser4 image natively in Google Compute Engine (GCE), aka Google Cloud.

Fact is I had used GPT to create the ~500MB ext2 /boot initial partition, ~1GB jfs for a /tmp, and root fs / as reiser4 (non-compression),
in VirtualBox 5.1.28.

After I custom/optimized the image for GCE, converted into disk.raw (VBoxManage requires >2TB ;-), tarred it (reduced it to 2.6GB), and
uploaded to Google cloud for subsequent processing, it would not boot; seems GPT booting is not fully supported.

Accordingly, I had to use gdisk
< http://www.rodsbooks.com/gdisk/hybrid.html >
 to hybridize GPT/MBR, see
< https://cloud.google.com/compute/docs/images/import-existing-image >

this was done by mounting the disk onto another running GCE instance and chrooting into it to accomplish ops.

Anyhow, I believe this is the first hack to have a ~2TB 'boot disk' reiser4 image natively booting in a cloud instance. Lucky Google ;-)

< https://metztli.it/blog/media/blogs/amatl/quick-uploads/p137/reiser4-2tb-running-date-plus-whole-screen.png >

Of course, thanks to Mr. Shishkin, for the latest patch and for making reiser4 possible against all odds.


Best Professional Regards.

P.S. Posted a serial output of the very first successful boot log of the Metztli-Reiser4 2TB cloud instanciation (xiuhcohuatl5) into GCE
 -- if anyone is interested:
< https://metztli.it/blog/index.php/amatl/reiser-nahui/reiser4-sfrn-4-0-2 >


Best Professional Regards.
