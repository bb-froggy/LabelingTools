# LabelingTools

Tools that help working with Microsoft Sensitivity Labels

## FindLabeledDocuments.ps1

Searches a given path for all files that are labeled with a specific Sensitivity Label. For encrypted documents, the user must have decryption rights in order to display the specific label. Files that cannot be accessed are also listed as such, including those with missing decryption rights.

### Example

```
.\FindLabeledDocuments.ps1 -Path "C:\" -Labels "Confidential", "Strictly Confidential" 1>businessfiles.txt
```

## License

All tools are available under the terms of the [MIT LICENSE](LICENSE).