From: "K. Posern" <quickhelp@gmail.com>
Subject: Re: strange problem with reiser4 with ccreg40 on amd64 2.6.35.2 vanilla
 kernel + tuxonice + reiser4 on a mdadm imsm raid-0 partition
Date: Thu, 26 Aug 2010 12:26:02 -0400
Message-ID: <4C76959A.40704@gmail.com>
References: <4C75BCBF.6010009@gmail.com> <4C7649FE.80604@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms050300050804090606040807"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type;
        bh=VF/oGwjAXyBl/T+BUXRiJLbMidWmG9K6UU1Hw9o0/TY=;
        b=GlicgL+QtErBEIGAScIHrKMQxywuE0x5SPe6Hf+MZLIeLObkiLe+50392vhTEL+3CW
         VkqT+FA6dCtbzkuV5dbUyNN2q/kdtwtFYY6uGDXM+76Dv2ySmhzS9PBNbvGhA+IcQWfA
         OccWaFeH1WViLRxXpibqZ6jPo4A0m2wa5mxy0=
In-Reply-To: <4C7649FE.80604@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms050300050804090606040807
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Dear Mr. Shishkin,

"Good" news: It seems reproducible (even though the symptoms are=20
different now ;)...

Please also note the question about my old notebook where I might have=20
seen a similar kernel oops just this morning.

I can keep the machine in its exact current state for another 5-6 hours.
Then I need to reboot. The partition I can leave untouched for longer.
Please let me know if you need something from the machine in its current =

state and when I can (eventually) free the reiser4 partition.

Up-front 4 (major) things I recently changed:
	- This problem report is about gentoo on a new notebook
	- The partition is not a simple /dev/sda partition, but part of a=20
RAID-0 intel "FakeRAID" that I access under linux with mdadm imsm.
	- The new installation uses 2.6.35.2 vanilla + tuxonice patch + reiser4 =

patch
	  (see end of my mail about what I used on my 32-bit machine)
	- The new installation is amd64 gentoo (my old notebook runs 32-bit 686 =

gentoo)

So here is what I did this morning:

(a) I formated the partition (I used yesterday, then formated to ext4=20
yesterday) with reiser4 again:
	mkfs.reiser4 -o create=3Dccreg40 -L "/vola (reiser4)" /dev/md126p7

(b) I rsynced the content in the state of yesterday evening back with=20
rsync -a

(c) I rebooted sanely

(d) It is mounted with:
/dev/md126p7    /mnt/vola       reiser4=20
nodev,nosuid,noatime,exec,tmgr.atom_max_size=3D16000,tmgr.atom_max_age=3D=
36000,dont_load_bitmap=20
0 0     # tmgr.atom_max_size=3D9000000

(e) I noticed that up until now I did not yet have my syslogd metalog=20
(automatically) started --> I fixed this and started it

(f) I ran the gentoo command to reinstall (recompile) javahelp (like=20
yesterday):
	emerge -qvt javahelp

(g) This time (unlike yesterday) it spit out kernel messages to the=20
console (and into syslog, not into dmesg). The last line on the screen:
	[  220.742824] note: java[3141] exited with preempt_count 1
Here is the full syslog:
	http://tormen.pastebin.com/nNCFtNnp
Here is the dmesg (I guess not needed, but still):
	http://tormen.pastebin.com/DxXzpU1H
Here is my uname -a:
	Linux seven 2.6.35.3-nogo-pixel #9 SMP PREEMPT Mon Aug 23 19:42:14 EDT=20
2010 x86_64 Intel(R) Core(TM) i7 CPU M 620 @ 2.67GHz GenuineIntel GNU/Lin=
ux
Here is the gentoo portage emerge logfile of the above emerge command:
	http://tormen.pastebin.com/ZXFxuQVU

(h) The console where I issued the emerge and saw the kernel oops got=20
stuck, no CTRL+C works, even though other tty's are still working.
A "sync" I issued on another console got stuck too (ctrl-c does not work)=
=2E

(i) I tried to access the directory (where gentoo unpacked and compiles) =

with zsh autocomplete. Here is how far I came before the console got=20
stuck (on TAB) (CTRL-c does not work):
	cd /vola/tmp.portage/portage/dev-java/javahelp-2.0.02_p46
(in there is usually the "work" directory which contains the source code)=

(/vola is a symlink pointing to /mnt/vola/sd)

As I mentioned:
The machine is still like this ... if I should try something...

//////////////////////////////////////////////////////////////////////

FINALLY...
I don't know if this is related or not, but I just looked in my 32-bit=20
gentoo syslog and found this (containing the same reiser-4 line then my=20
64-bit machine kernel oops from this morning):

Aug 26 10:34:08 [kernel] [565941.926011] BUG: unable to handle kernel=20
NULL pointer dereference at 00000030
Aug 26 10:34:08 [kernel] [565941.926020] IP: [<c07d84c0>]=20
_raw_spin_lock+0x10/0x20
Aug 26 10:34:08 [kernel] [565941.926050] *pde =3D 00000000
Aug 26 10:34:08 [kernel] [565941.926083] Modules linked in: vboxnetflt=20
vboxdrv ehci_hcd uhci_hcd usbcore e1000e toshiba_acpi [last unloaded:=20
iwlagn]
Aug 26 10:34:08 [kernel] [565941.926115]
Aug 26 10:34:08 [kernel] [565941.926137] Pid: 22234, comm: evince Not=20
tainted 2.6.34.2-nogo-pixel #3 Portable PC/PORTEGE R500
Aug 26 10:34:08 [kernel] [565941.926142] EIP: 0060:[<c07d84c0>] EFLAGS:=20
00010202 CPU: 0
Aug 26 10:34:08 [kernel] [565941.926147] EIP is at _raw_spin_lock+0x10/0x=
20
Aug 26 10:34:08 [kernel] [565941.926168] EAX: 00000030 EBX: 00000000=20
ECX: 00000000 EDX: 00000100
Aug 26 10:34:08 [kernel] [565941.926172] ESI: c1bf71c0 EDI: c3b834f4=20
EBP: f61cfdd4 ESP: f61cfd44
Aug 26 10:34:08 [kernel] [565941.926176]  DS: 007b ES: 007b FS: 00d8 GS: =

00e0 SS: 0068
Aug 26 10:34:08 [kernel] [565941.926203]  c033413a 00000000 00000246=20
00000002 00000000 00000000 00000010 00000000
Aug 26 10:34:08 [kernel] [565941.926212] <0> 00000000 c1bf71c0 00000000=20
f61cfdd4 c03360c3 00000000 00000000 f61cfdd4
Aug 26 10:34:08 [kernel] [565941.926240] <0> 00000001 c3b834f4 00000000=20
c1bf71c0 f61cfe2c fffffff4 c0336268 000200da
Aug 26 10:34:08 [kernel] [565941.926275]  [<c033413a>] ?=20
checkin_logical_cluster+0x1a/0x290
Aug 26 10:34:08 [kernel] [565941.926301]  [<c03360c3>] ?=20
capture_page_cluster+0x53/0xf0
Aug 26 10:34:08 [kernel] [565941.926307]  [<c0336268>] ?=20
write_end_cryptcompress+0x108/0x2b0
Aug 26 10:34:08 [kernel] [565941.926331]  [<c027f447>] ?=20
__alloc_pages_nodemask+0xd7/0x580
Aug 26 10:34:08 [kernel] [565941.926338]  [<c033296e>] ?=20
reiser4_write_end_careful+0xbe/0x190
Aug 26 10:34:08 [kernel] [565941.926363]  [<c0278767>] ?=20
pagecache_write_end+0x57/0x70
Aug 26 10:34:08 [kernel] [565941.926369]  [<c02c3489>] ?=20
__mark_inode_dirty+0x59/0x160
Aug 26 10:34:08 [kernel] [565941.926392]  [<c02c5e6a>] ?=20
pipe_to_file+0x11a/0x140
Aug 26 10:34:08 [kernel] [565941.926397]  [<c02c3489>] ?=20
__mark_inode_dirty+0x59/0x160
Aug 26 10:34:08 [kernel] [565941.926402]  [<c02c3489>] ?=20
__mark_inode_dirty+0x59/0x160
Aug 26 10:34:08 [kernel] [565941.926430]  [<c02c5d50>] ?=20
pipe_to_file+0x0/0x140
Aug 26 10:34:08 [kernel] [565941.926436]  [<c02c5c9b>] ?=20
generic_file_splice_write+0xcb/0x180
Aug 26 10:34:08 [kernel] [565941.926460]  [<c02c5860>] ?=20
spd_release_page+0x0/0x10
Aug 26 10:34:08 [kernel] [565941.926465]  [<c02c5bd0>] ?=20
generic_file_splice_write+0x0/0x180
Aug 26 10:34:08 [kernel] [565941.926488]  [<c02c5179>] ?=20
do_splice_from+0x69/0x90
Aug 26 10:34:08 [kernel] [565941.926494]  [<c02c55b6>] ?=20
sys_splice+0x2a6/0x520
Aug 26 10:34:08 [kernel] [565941.926500]  [<c02ae080>] ? sys_pipe2+0x40/0=
x70
Aug 26 10:34:08 [kernel] [565941.926524]  [<c0202d17>] ?=20
sysenter_do_call+0x12/0x26
Aug 26 10:34:08 [kernel] [565941.926530]  [<c07d0000>] ?=20
cpu_init+0x2ef/0x341
Aug 26 10:34:08 [kernel] [565941.926689] ---[ end trace 8a3e6ebc317bfbfe =

]---
Aug 26 10:34:08 [kernel] [565941.926713] note: evince[22234] exited with =

preempt_count 1
Aug 26 10:34:14 [acpid] ACPI Battery Event: 100%

As mentioned I am using reiser4 since YEARS without *any* problems.
What I changed on my 32-bit machine:
	Beginning of August I updated from v2.6.31.3 to v2.6.33.5 and then to=20
v2.6.34.2 (I was using 2.6.31.3 since december 2009 without problems).
The uname:
	Linux pixel 2.6.34.2-nogo-pixel #3 SMP PREEMPT Tue Aug 3 18:46:20 EDT=20
2010 i686 Intel(R) Core(TM)2 CPU U7600 @ 1.20GHz GenuineIntel GNU/Linux

Don't know if this could be related?! (and if it this kernel oops seems=20
to indicate an reiser4 implication at all ?!)=09

Please let me know if you need anything.

Thanks,

Knuth

On 26/08/10 07:03, Edward Shishkin wrote:
> K. Posern wrote:
>> If I compile javahelp on the reiser4 partition (mounted without any
>> special options), I get:
>>
>> # du -h ./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.j=
ar
>> 120K ./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar
>> # ls -la ./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.=
jar
>> -rw-r--r-- 1 portage portage 0 Aug 25 16:35
>
> Is it reproducible?
> Any suspicious kernel messages being?
> Also could you please fsck the partition (I wonder if there are any
> orphan things)
>
> It might be because of this verrry ancient bug, which has been caught,
> but not yet fixed:
> http://marc.info/?l=3Dreiserfs-devel&m=3D127533196521722&w=3D2
>
> Thanks for report,
> Edward.


--------------ms050300050804090606040807
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKajCC
BTEwggMZoAMCAQICAwYm8zANBgkqhkiG9w0BAQUFADB5MRAwDgYDVQQKEwdSb290IENBMR4w
HAYDVQQLExVodHRwOi8vd3d3LmNhY2VydC5vcmcxIjAgBgNVBAMTGUNBIENlcnQgU2lnbmlu
ZyBBdXRob3JpdHkxITAfBgkqhkiG9w0BCQEWEnN1cHBvcnRAY2FjZXJ0Lm9yZzAeFw0wODEy
MTIxOTEzNDFaFw0xMDEyMTIxOTEzNDFaMDsxFTATBgNVBAMTDEtudXRoIFBvc2VybjEiMCAG
CSqGSIb3DQEJARYTcXVpY2toZWxwQGdtYWlsLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEP
ADCCAQoCggEBAM/XLQlhOxcmVwIU0kEDlqL9OiNezGZpMhzB/c1ibGEfBxC0v6GfQd+k00a0
tL4uzwNHquu3Lk49cc9AJbIUbppd9H0RY1dD9FpjjC8SmPlb9ZofRSr7lPlDfD4A8EqLw7KB
sp3yUs1kl7SYKAlX7JJgCqzo+CxxOEuO11dnv/ruezOMyGRPOBBMCPiPLyr7iOjkvWObgIoC
82f4EhfsXNPTV3z2b2s1k/0JPIr1t2klk8bta/8MdjSF6E3SjJyyXp0mq48izityMpi5J0U3
Gz2G9EIUBRILVSY/ZZQz2W8Ur2jhItSbpY1qLv6aSCFsrPsFOyc8HEHUaJ+SwF0WbD0CAwEA
AaOB/zCB/DAMBgNVHRMBAf8EAjAAMFYGCWCGSAGG+EIBDQRJFkdUbyBnZXQgeW91ciBvd24g
Y2VydGlmaWNhdGUgZm9yIEZSRUUgaGVhZCBvdmVyIHRvIGh0dHA6Ly93d3cuQ0FjZXJ0Lm9y
ZzBABgNVHSUEOTA3BggrBgEFBQcDBAYIKwYBBQUHAwIGCisGAQQBgjcKAwQGCisGAQQBgjcK
AwMGCWCGSAGG+EIEATAyBggrBgEFBQcBAQQmMCQwIgYIKwYBBQUHMAGGFmh0dHA6Ly9vY3Nw
LmNhY2VydC5vcmcwHgYDVR0RBBcwFYETcXVpY2toZWxwQGdtYWlsLmNvbTANBgkqhkiG9w0B
AQUFAAOCAgEAzBJqLQB9q+ZEfvidFXWVNyfEiRmvDbvOdsg+6Pl38RqKHchoZpdqsfyZV3Lv
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
MBwGA1UECxMVaHR0cDovL3d3dy5jYWNlcnQub3JnMSIwIAYDVQQDExlDQSBDZXJ0IFNpZ25p
bmcgQXV0aG9yaXR5MSEwHwYJKoZIhvcNAQkBFhJzdXBwb3J0QGNhY2VydC5vcmcCAwYm8zAJ
BgUrDgMCGgUAoIIB6DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEP
Fw0xMDA4MjYxNjI2MDJaMCMGCSqGSIb3DQEJBDEWBBTtm8Y3tQ5TE4vu6jbLjvWoIzWukjBf
BgkqhkiG9w0BCQ8xUjBQMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgZEGCSsGAQQBgjcQ
BDGBgzCBgDB5MRAwDgYDVQQKEwdSb290IENBMR4wHAYDVQQLExVodHRwOi8vd3d3LmNhY2Vy
dC5vcmcxIjAgBgNVBAMTGUNBIENlcnQgU2lnbmluZyBBdXRob3JpdHkxITAfBgkqhkiG9w0B
CQEWEnN1cHBvcnRAY2FjZXJ0Lm9yZwIDBibzMIGTBgsqhkiG9w0BCRACCzGBg6CBgDB5MRAw
DgYDVQQKEwdSb290IENBMR4wHAYDVQQLExVodHRwOi8vd3d3LmNhY2VydC5vcmcxIjAgBgNV
BAMTGUNBIENlcnQgU2lnbmluZyBBdXRob3JpdHkxITAfBgkqhkiG9w0BCQEWEnN1cHBvcnRA
Y2FjZXJ0Lm9yZwIDBibzMA0GCSqGSIb3DQEBAQUABIIBAGxa6zyxTUa9tc6umhi9TuH7rCrE
idmGiTu3+81Qde8ereyTCBsXFlVgWJVdLswREEdw8IYN2qUgo5d9EtUT5JdeQDRiZQcgJhds
V95V7w29nJj2eg9X18Ljr/6wcfDwMnQoTt42a0aQBCGVSSKgC3nH/GiJWHodgMGCCiON2jHI
c1hHqEqiN+MjpiRsihVbVoK739+W1Eha1kaMOcKlVpY3vzcophvFdkGRtHdltiXrpHkNK02R
FOs2EV37Iua64/ZJVPvOp6uqsADB8j6QE2KgcrYDO5JGW0c8xb+97eKPHES22HN4QnECCkC3
rg32kA2b8CWeAz/rsRvUPKhGnI4AAAAAAAA=
--------------ms050300050804090606040807--
