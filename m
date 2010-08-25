From: Jarrid Graham <jarrid.graham@gmail.com>
Subject: Reiser4 encrypted speed
Date: Tue, 24 Aug 2010 23:19:05 -0400
Message-ID: <AANLkTik3-OkirtL_fzVXmoQmHYxCzE52tNWRX3iODqiq@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=lXr/HRMFAAjtMgAo+W/2mCA45DIWDQjen53GW390V80=;
        b=KCc2aWSmdcsb3CjQ8Li3DuyLteedoIHBLiFdfbp9vYao5Gq5VcmNQMNsHcOAtjGbbV
         NG3wN6RAvoXdQp7KOOMo8Cx/bShUtrbbbJU/cqtDVqX8bzNBQmoxzgQp3d97WX/mASo2
         qid2KqkhL8/l/9p89VplfK/gqu2YJVDE6WljA=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hi, first off I want to say I am not posting this to say one FS is
better than the other, just something I ran into thought there may be
an issue. First off I was setting up and rsync server to store medical
databases. There fairly large and I use encrypted file
containers(Truecrypt). I started off with an ext4 FS in the container
and all was well but I wanted something with some compression so I
tried the reiser4 FS and got really good compression. I set it up and
thought all was good. The next day I noticed the rsync had not
completed and was actually still running just really slow. So I
stopped it and watched it run and noticed the CPU was maxed out so I
thought well there is the problem just too much CPU time with
encryption and compression. After a couple of days I just wanted to
make a test. I did some test with ext4, reiser4, and btrfs with and
without being encrypted, and did some simple time tests and found that
the sum operation was much slower when it was in an encrypted
container than when it was not. My test set up was two separate hard
drives on an 8 CPU machine with 16GB of ram. I did just a simple copy
and then sum of a 23GB file. The target drive was an 80GB drive and I
just used one partition and formatted them.

With the reiser4 fs I used the option -o create=ccreg40,compress=gzip1

with the btrfs I used the mount options -o compress (which did not
compress the file at all) and -o compress-force

here is a table I made I hope it stays formatted

					                -o compress	-o compress-force
	ext4		        reiser4.gzip	Btrfs 	
cp	7m51.406s	9m25.903s	7m6.808s	        7m47.110s
	0m1.103s	        0m0.098s	        0m0.724s	        0m0.797s
	1m47.141s	0m35.391s	0m52.885s	0m54.499s
				
sum	5m50.562s	4m52.599s	5m22.873s	5m2.472s
	1m3.782s	        1m13.078s	1m17.149s	1m26.324s
	0m32.918s	2m48.619s	0m28.767s	1m5.546s
				
		Truecrypt
		
cp	7m41.669s	7m44.611s			         7m21.847s
	0m0.573s	        0m0.067s			                 0m0.735s
	0m47.210s	0m38.285s			         0m55.225s
				
sum	5m21.034s	41m38.636s			         8m13.561s
	1m19.902s	1m10.509s			         1m18.920s
	0m27.289s	2m21.986s			         1m9.792s

I did not test the btrfs, mount -o compress in the encryption because
it did not compress the file hardly at all 1.04:1 but the reiser4 did
compress the best. I did expect some slow down and that is not problem
for the trade off of compression but you can see it took nearly 10x
longer with encryption. The reiser4 compressed the file 7.62:1 and
btrfs was 7.21:1. This may be just the way it is but I didn't know if
it was anything anyone would be interested in.

Thanks

Jarrid Graham
