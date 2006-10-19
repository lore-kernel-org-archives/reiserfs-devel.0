From: Christophe Greisberger <greisberger@zenon-media.com>
Subject: Segfault mounting a reiserfs 3.6 partition
Date: Thu, 19 Oct 2006 09:02:58 +0200
Message-ID: <200610190903.43896.greisberger@zenon-media.com>
Reply-To: greisberger@zenon-media.net
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1842700.aHH3c1Ygqy";
  protocol="application/pkcs7-signature";
  micalg=sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30073-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart1842700.aHH3c1Ygqy
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I have a strange problem with a partition w/ reiserfs.
After a power loss, the partition has been damaged in a way reiserfs doesn'=
t=20
seem to handle correctly. When mounting the partition, there is a segfault.
The original system was a SuSE 8.0 (kernel 2.4.20)
I did a 'reiserfsck --check ' , then a 'reiserfsck --fix-fixable' : no=20
errors found/fixed.
I then tried 'reiserfsck --rebuild-sb' and 'reiserfsck --rebuild-tree' :=20
some errors fixed, still segfaulting.
=46inally, 'reiserfsck --clean-attributes' : no errors found, still=20
segfaulting.

I then tried with a recent SuSE live CD (10.0 - kernel 2.6.13) : same error.

=46inally, I used sysresccd (kernel 2.6.16.10)  to save & restore the=20
partition with partimage, hoping that it would rebuild a clean partition.
=2DThe save was ok.
=2DI then reformatted the partition with r/w check - ok.
=2DThe restoration worked.
I then tried to mount the partition : still the same error. Damn!

Here the error :
=2D---------8<----------
# mount /dev/sda4 /mnt/temp1
ReiserFS: sda4: found reiserfs format "3.6" with standard journal
ReiserFS: sda4: using ordered data mode
ReiserFS: sda4: journal params: device sda4, size 8192, journal first block=
=20
18, max trans len 1024,
max batch 900, max commit age 30, max trans age 30
ReiserFS: sda4: checking transaction log (sda4)
ReiserFS: sda4: Using r5 hash to sort names
=2D-----------[ cut here ]------------
kernel BUG at fs/reiserfs/journal.c:3168!
invalid opcode: 0000 [#1]
Modules linked in: i2c_nforce2 yellowfin via_velocity typhoon tg3 sungem_ph=
y=20
sundance starfire slip
slhc skge sis900 sis190 shaper s2io plip pcnet32 ns83820 ne3210 ne2k_pci=20
natsemi hp100 hamachi fealnx epic100 eepro100 dl2k dgrs depca cassini bnx2=
=20
b44 amd8111e 8390 8139cp 3c59x 3c509
CPU:    0
EIP:    0060:[<c01a5c4d>]    Not tainted VLI
EFLAGS: 00010246   (2.6.16.10-fd24 #1)
EIP is at journal_mark_dirty+0x215/0x240
eax: cfb5dc00   ebx: cfb5dc00   ecx: 00000002   edx: 00000000
esi: d0061600   edi: cf073e08   ebp: e0df5000   esp: cf09ddc4
ds: 007b   es: 007b   ss: 0068
Process mount (pid: 4720, threadinfo=3Dcf09c000 task=3Ddfae4570)
Stack: <0>00000002 00000000 cfb5dc00 ce7f5dac d0061600 d0061600 c019779c=20
cf09de1c
       d0061600 cf073e08 00000000 cef17000 00000000 00000002 00000001=20
00000000
       00000000 00000000 00000004 dfb875f0 cf09de74 c0367a02 d0061600=20
00000001
Call Trace:
 [<c019779c>] reiserfs_fill_super+0x58c/0x664
 [<c0367a02>] snprintf+0x16/0x1c
 [<c014d8d7>] get_sb_bdev+0xbb/0x114
 [<c036842e>] strncpy_from_user+0x2e/0x4c
 [<c016016c>] copy_mount_options+0x44/0xa0
 [<c016061c>] sys_mount+0x74/0xb0
 [<c0102ce9>] syscall_call+0x7/0xb
Code: 8b 45 30 50 68 fc bd 6c c0 56 e8 bb 2d ff ff 83 c4 0c b8 01 00 00 00=
=20
eb b3 50 52 68 40 be 6c c0 8b 54 24 28 ff 32 e8 4f 2e ff ff <0f> 0b 60 0c=20
72 cd 6b c0 e9 0d fe ff ff 52 68 7c be 6c c0 8b 44
 Badness in do_exit at kernel/exit.c:802
 [<c0115af1>] do_exit+0x34d/0x358
 [<c01035ac>] do_trap+0x0/0xd4
 [<c0103828>] do_invalid_op+0x0/0x88
 [<c01038a2>] do_invalid_op+0x7a/0x88
 [<c0110907>] __wake_up_common+0x27/0x4c
 [<c01a5c4d>] journal_mark_dirty+0x215/0x240
 [<c067b395>] schedule+0x2dd/0x5d0
 [<c067bbb7>] cond_resched+0x37/0x50
 [<c01a5592>] do_journal_begin_r+0x56/0x2b8
 [<c0102f13>] error_code+0x4f/0x54
 [<c01a5c4d>] journal_mark_dirty+0x215/0x240
 [<c019779c>] reiserfs_fill_super+0x58c/0x664
 [<c0367a02>] snprintf+0x16/0x1c
 [<c014d8d7>] get_sb_bdev+0xbb/0x114
 [<c01980aa>] get_super_block+0x1a/0x20
 [<c0197210>] reiserfs_fill_super+0x0/0x664
 [<c014da8c>] do_kern_mount+0x3c/0x98
 [<c015fe02>] do_new_mount+0x62/0xa8
 [<c0160357>] do_mount+0x18f/0x1bc
 [<c036842e>] strncpy_from_user+0x2e/0x4c
 [<c016016c>] copy_mount_options+0x44/0xa0
 [<c016061c>] sys_mount+0x74/0xb0
 [<c0102ce9>] syscall_call+0x7/0xb
Segmentation fault
=2D---------8<----------

I also googled a while, but I only found a post (was in 2005 I think), with=
=20
the same error, but to which nobody answered.

An idea someone?

=2D-=20
Christophe Greisberger
Zenon-Media GmbH
Phone: +49 (7852) 9133 / 34
=46ax  : +49 (7852) 9133 / 35
=2D-
Linux doesn't dictate how I work,
I dictate how Linux works.

--nextPart1842700.aHH3c1Ygqy
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIGUzCCBk8w
ggQ3oAMCAQICAwJpUjANBgkqhkiG9w0BAQUFADB5MRAwDgYDVQQKEwdSb290IENBMR4wHAYDVQQL
ExVodHRwOi8vd3d3LmNhY2VydC5vcmcxIjAgBgNVBAMTGUNBIENlcnQgU2lnbmluZyBBdXRob3Jp
dHkxITAfBgkqhkiG9w0BCQEWEnN1cHBvcnRAY2FjZXJ0Lm9yZzAeFw0wNjA2MjkxMDMwMjNaFw0w
NzA2MjkxMDMwMjNaMIIBEjEfMB0GA1UEAxMWQ2hyaXN0b3BoZSBHcmVpc2JlcmdlcjEpMCcGCSqG
SIb3DQEJARYaY2hyaXN0b3BoZUBncmVpc2Jlcmdlci5uZXQxIjAgBgkqhkiG9w0BCQEWE2dyZWlz
YnlAaG90bWFpbC5jb20xHzAdBgkqhkiG9w0BCQEWEGdyZWlzYnlAeWFob28uZnIxIDAeBgkqhkiG
9w0BCQEWEWdyZWlzYnlAZ21haWwuY29tMTEwLwYJKoZIhvcNAQkBFiJjaHJpc3RvcGhlLmdyZWlz
YmVyZ2VyQGxhcG9zdGUubmV0MSowKAYJKoZIhvcNAQkBFhtncmVpc2JlcmdlckB6ZW5vbi1tZWRp
YS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCgpa8R5H20HLu1hob8rWDxJ/+L
kS4ajgq4uooJjMed4nfGTGH9MwzMcvcpSLFjlYSYktDnVPoVlvmW9xyYGVJFozIJOtL+lRAOUohl
SAm6l5JgULzrF9AJ55utfc3R7uHyDUvpnlllbGOZVBGwXz1Ew0MyUQUOUoY8IpdxrtMcL87h8wOQ
eTtcRj9HDzLHyLslz5nMiESsGdRtEhfVkXhn3rjUjDK2vWo4Qr4bAjNZjXccXkyUPFU/ATYFWBFm
7wA8VJgDuK3rb/xlVSWl2sMUDFLJo5Zik7UC/DQbcZFq6gVIJaRBxIvsRcoLnbpB/YdB3Wrhjjn3
88jBqy2FQHiPAgMBAAGjggFDMIIBPzAMBgNVHRMBAf8EAjAAMFYGCWCGSAGG+EIBDQRJFkdUbyBn
ZXQgeW91ciBvd24gY2VydGlmaWNhdGUgZm9yIEZSRUUgaGVhZCBvdmVyIHRvIGh0dHA6Ly93d3cu
Q0FjZXJ0Lm9yZzAyBggrBgEFBQcBAQQmMCQwIgYIKwYBBQUHMAGGFmh0dHA6Ly9vY3NwLmNhY2Vy
dC5vcmcwgaIGA1UdEQSBmjCBl4EaY2hyaXN0b3BoZUBncmVpc2Jlcmdlci5uZXSBE2dyZWlzYnlA
aG90bWFpbC5jb22BEGdyZWlzYnlAeWFob28uZnKBEWdyZWlzYnlAZ21haWwuY29tgSJjaHJpc3Rv
cGhlLmdyZWlzYmVyZ2VyQGxhcG9zdGUubmV0gRtncmVpc2JlcmdlckB6ZW5vbi1tZWRpYS5jb20w
DQYJKoZIhvcNAQEFBQADggIBAEg4UL5xF8qITPMzO0wEsW8PqNslcATMoFaAdj8Sjv5c44miWtWZ
yNG1/AI9UginSoDMhlZOh6KsSYJDA8Au6olyYdSpfI1MPoQoMcgGB8EejLiTL3DbbI+YxoGmqxQR
aH7/sg8wqFbP39WBtspyVnmJ5dksUOOCin4Y3KHyA55zTg/vSTAKSx3bjaH0qjLxBCgNvaq4+B2Y
gFJRot1HGNPpCFWHh7hWiqU4deteBFyKW9wN6Qt1Tmpq0MulqWQij6YXxwAth+8i5gh22SOB3jzD
TykFxz+e7UZLzcaQeUcObierSLhNwCJFARD9pyeo09Blz1V9YuOnh2RIYTUgKjx8i8zshn6rv1v2
VV5I58Mtgd4xi3c61ur4LEYWdYbrBtzngvMo9we5B05C/LiB7N8jmQ4Lg9QunrZmymYdPq9qp4Tk
diyZdVs+Laa+pdUySJn6jc2ZFMyGUwNJZpVrYpIq4BAELvvBndJUos57UKT2mqZcXX4ifWTkxqxZ
bcaPpgxYzy/78X1t7xo2jL4HkazNw3AB63Red2hmOns1SEDI/LrDMktDAxyT4NHEtxxzuLN1Mezl
1VEoxulwOGz3cpqQuVTEkQ5KYk1xzPsVbhSMFXe8yWQJsVW3VhMdlAmUgERcJvPZOUn+iQNGCKWH
KA8HDsRXBUFHoAcflzZs1Bp8MYICMjCCAi4CAQEwgYAweTEQMA4GA1UEChMHUm9vdCBDQTEeMBwG
A1UECxMVaHR0cDovL3d3dy5jYWNlcnQub3JnMSIwIAYDVQQDExlDQSBDZXJ0IFNpZ25pbmcgQXV0
aG9yaXR5MSEwHwYJKoZIhvcNAQkBFhJzdXBwb3J0QGNhY2VydC5vcmcCAwJpUjAHBgUrDgMCGqCB
izAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wNjEwMTkwNzAzMTJa
MCMGCSqGSIb3DQEJBDEWBBRyjkG5njC+x5hcRdtJLqi8hbY7GTAsBgkqhkiG9w0BCQ8xHzAdMA0G
CWCGSAFlAwQBAgUAMAwGCCqGSIb3DQMHBQAwCwYJKoZIhvcNAQEBBIIBAJw4E+581GcM3uD9ejsf
jNfphzS01S0lt1eqzdc2DzT740m9zUHv0lXCGYTdx19NsRJi3Y3my3jXlH1iPwLuM/mvQjhDp6D2
WTWNbKy2IYbyaJdF+7Fr7dwUMJvKP1eryhBHs4BN6f0e/jY0mgjuHLBfUDxwbS9ZW1zAL7MpQxpO
SMDbk4bYjbMO8WVHZhu8EekzJqjln1mhA3ZQTDE+w2G0CHmAJDh+v2Ydg7RBbSBCIxOVWL7Dbsjn
qFka0fJBZ289Yky2SGotQ0m8CYujokDOqA3qaEabfJ2RW3vgemY2rU4KbPyi//6HWdbgBHUWe5gL
Rn2DqjjqCO26guH1TBsAAAAAAAA=

--nextPart1842700.aHH3c1Ygqy--
