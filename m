From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: fsck.reiser4-1.1.0 doesn't remove corrupted files
Date: Thu, 11 Aug 2016 16:56:21 +0200
Message-ID: <e6cde322-7b3e-8d87-151b-0adba96c3ee2@gmail.com>
References: <CADW=+3nf-BRyzJApVavoq-tUXNj=sAJbxqUXL=822-BCSrd7BA@mail.gmail.com>
 <d594760a-6ea1-d3a8-b06c-4b7c7341c9a8@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=FzdOqnyMgKfcdLEHAIvnLaqozHWdmAAVyqQtwCzD5kY=;
        b=RfduNZH0kjD+MfOuXUvLW3iii4S/iLcXNnAjJocNUVloQbkYJzdYHZ+w4ZaPAucRrc
         4lBOLQR9zI9RJcdtb11plvrTufiRfq73F5Pq0rFt8TeF+5CiF/WdGzvJWJxy9Wr+rF8R
         zdo08ZhpwKJhMAkj5VynU40VCexUiHS9NpKSsJjf2zVK/WOCs7Wi+Twmjsqc9KpbAnrp
         rfEA7a5EfLPbTG+eKyHpizQRbKQkvb7aZZKKS1gGltmcaMlneYJtk4HMMIRY0HadChXL
         IsuZmrtyj3A8pFWaXgsurs0y6CX4FQA/GdUAUlI5rGVnWy/tCtakT+FdKDEK9CM9tCxe
         4A/g==
In-Reply-To: <d594760a-6ea1-d3a8-b06c-4b7c7341c9a8@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Ah, that is indeed wrecks of 3 different files (inodes 19583332, 
19217645 and 19145295).

On 08/11/2016 04:33 PM, Edward Shishkin wrote:
> On 08/11/2016 04:12 PM, Dušan Čolić wrote:
>> Every time I check one same partition it warns me that same files are 
>> corrupted.
>> After fsck.reiser4 --build-fs those errors aren't fixed.
>
> It looks like fsck doesn't actually remove the corrupted cluster.
> I need a remote access to fix it, no other way..
>
>>   Strangely, if
>> I read it correctly, one same cluster containing 3 files is corrupted.
>
> Cluster is a chunk of file's body. In you case it is 64K long and
> occupies 3 leaf nodes in the tree.
>
>> In logs on mount:
>>
>> Aug 11 16:11:15 krshina3 kernel: reiser4[mount(9121)]:
>> try_init_format40
>> (fs/reiser4/plugin/disk_format/disk_format40.c:303)[vpf-1364]:\x0aNOTICE: 
>>
>> Warning: mounting md125 with fatal errors, forcing read-only mount.
>>
>>
>> krshina3 dusan # fsck.reiser4 --build-fs /dev/md125
>> *******************************************************************
>> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
>> *******************************************************************
>>
>> Fscking the /dev/md125 block device.
>> Will check the consistency of the Reiser4 SuperBlock.
>> Will build the Reiser4 FileSystem.
>> Continue?
>> (Yes/No): y
>> ***** fsck.reiser4 started at Thu Aug 11 13:54:49 2016
>> Reiser4 fs was detected on /dev/md125.
>> Master super block (16):
>> magic:          ReIsEr4
>> blksize:        4096
>> format:         0x0 (format40)
>> uuid:           184e9560-bdf9-42b0-896c-0af2a0c84066
>> label:          <none>
>>
>> Format super block (17):
>> plugin:         format40
>> description:    Disk-format plugin.
>> version:        1
>> magic:          ReIsEr40FoRmAt
>> mkfs id:        0x2a685787
>> flushes:        0
>> blocks:         17091120
>> free blocks:    3030583
>> root block:     10465827
>> tail policy:    0x2 (smart)
>> next oid:       0x12b412f
>> file count:     1258379
>> tree height:    5
>> key policy:     LARGE
>>
>>
>> CHECKING THE STORAGE TREE
>>          Read nodes 7914473
>>          Nodes left in the tree 7914473
>>                  Leaves of them 7819775, Twigs of them 93497
>>          Time interval: Thu Aug 11 13:54:53 2016 - Thu Aug 11 
>> 14:06:40 2016
>> CHECKING EXTENT REGIONS.
>>          Read twigs 93497
>>          Time interval: Thu Aug 11 14:06:40 2016 - Thu Aug 11 
>> 14:12:39 2016
>> LOOKING FOR UNCONNECTED NODES
>>          Read nodes 0
>>          Good nodes 0
>>                  Leaves of them 0, Twigs of them 0
>>          Time interval: Thu Aug 11 14:12:39 2016 - Thu Aug 11 
>> 14:12:39 2016
>> CHECKING EXTENT REGIONS.
>>          Read twigs 0
>>          Time interval: Thu Aug 11 14:12:39 2016 - Thu Aug 11 
>> 14:12:39 2016
>> INSERTING UNCONNECTED NODES
>> 1. Twigs: done
>> 2. Twigs by item: done
>> 3. Leaves: done
>> 4. Leaves by item: done
>>          Twigs: read 0, inserted 0, by item 0, empty 0
>>          Leaves: read 0, inserted 0, by item 0
>>          Time interval: Thu Aug 11 14:12:39 2016 - Thu Aug 11 
>> 14:12:39 2016
>> CHECKING THE SEMANTIC TREE
>> FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
>> [12ad163:2e77696e646f77:12ad164] (ccreg40): the cluster at 
>> [851116032] offset
>> 65536 bytes long is corrupted. Removed.
>> FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
>> [1253cec:2e77696e646f77:1253ced] (ccreg40): the cluster at 
>> [851116032] offset
>> 65536 bytes long is corrupted. Removed.
>> FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
>> [124224e:2e77696e646f77:124224f] (ccreg40): the cluster at 
>> [851116032] offset
>> 65536 bytes long is corrupted. Removed.
>>          Found 1258379 objects.
>>          Time interval: Thu Aug 11 14:12:39 2016 - Thu Aug 11 
>> 14:51:12 2016
>> CLEANING UP THE STORAGE TREE
>>          Removed items 0
>>          Time interval: Thu Aug 11 14:51:12 2016 - Thu Aug 11 
>> 15:08:59 2016
>> ***** fsck.reiser4 finished at Thu Aug 11 15:08:59 2016
>> Closing fs...done
>>
>> FS is consistent.
>>
>> And then:
>>
>> krshina3 dusan # fsck.reiser4 -y /dev/md125
>> *******************************************************************
>> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
>> *******************************************************************
>>
>> Fscking the /dev/md125 block device.
>> Will check the consistency of the Reiser4 SuperBlock.
>> Will check the consistency of the Reiser4 FileSystem.
>> ***** fsck.reiser4 started at Thu Aug 11 15:31:52 2016
>> Reiser4 fs was detected on /dev/md125.
>> Master super block (16):
>> magic:          ReIsEr4
>> blksize:        4096
>> format:         0x0 (format40)
>> uuid:           184e9560-bdf9-42b0-896c-0af2a0c84066
>> label:          <none>
>>
>> Format super block (17):
>> plugin:         format40
>> description:    Disk-format plugin.
>> version:        1
>> magic:          ReIsEr40FoRmAt
>> mkfs id:        0x2a685787
>> flushes:        0
>> blocks:         17091120
>> free blocks:    3030583
>> root block:     10465827
>> tail policy:    0x2 (smart)
>> next oid:       0x12b412f
>> file count:     1258379
>> tree height:    5
>> key policy:     LARGE
>>
>>
>> CHECKING THE STORAGE TREE
>>          Read nodes 7914473
>>          Nodes left in the tree 7914473
>>                  Leaves of them 7819775, Twigs of them 93497
>>          Time interval: Thu Aug 11 15:31:56 2016 - Thu Aug 11 
>> 15:41:52 2016
>> CHECKING EXTENT REGIONS.
>>          Read twigs 93497
>>          Time interval: Thu Aug 11 15:41:52 2016 - Thu Aug 11 
>> 15:47:27 2016
>> CHECKING THE SEMANTIC TREE
>> FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
>> [12ad163:2e77696e646f77:12ad164] (ccreg40): the cluster at [851116032]
>> offset 65536 bytes long
>> is corrupted.
>> FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
>> [1253cec:2e77696e646f77:1253ced] (ccreg40): the cluster at [851116032]
>> offset 65536 bytes long
>> is corrupted.
>> FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
>> [124224e:2e77696e646f77:124224f] (ccreg40): the cluster at [851116032]
>> offset 65536 bytes long
>> is corrupted.
>>          Found 3248399 objects (some could be encountered more then 
>> once).
>>          Time interval: Thu Aug 11 15:47:28 2016 - Thu Aug 11 
>> 16:07:43 2016
>> ***** fsck.reiser4 finished at Thu Aug 11 16:07:43 2016
>> Closing fs...done
>>
>> 3 fatal corruptions were detected in FileSystem. Run with --build-fs
>> option to fix them.
>

